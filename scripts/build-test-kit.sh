#!/usr/bin/env bash
# Build a test kit locally from an exact private source tag and stage only the
# kit archive, checksum, and install instructions in the public release repo.
set -euo pipefail

usage() {
  echo "Usage: $0 <private-source-checkout> <source-commit> <kit-label> [output-directory]" >&2
  exit 2
}

[[ $# -ge 3 && $# -le 4 ]] || usage
source_checkout=$(realpath "$1")
source_ref=$2
label=$3
public_repo=$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)
output_dir=${4:-"$public_repo/dist/$label"}
output_dir=$(realpath -m "$output_dir")

git -C "$public_repo" diff --quiet
[[ -z $(git -C "$public_repo" status --porcelain) ]] || {
  echo "public release checkout must be clean before building" >&2
  exit 1
}
source_commit=$(git -C "$source_checkout" rev-parse --verify "$source_ref^{commit}" 2>/dev/null) || {
  echo "source commit or ref is missing: $source_ref" >&2
  exit 1
}

version=$(git -C "$source_checkout" show "$source_commit:Cargo.toml" \
  | sed -n 's/^version = "\(.*\)"/\1/p' | head -n 1)
[[ -n $version && $label =~ ^[A-Za-z0-9][A-Za-z0-9.-]*$ ]] || {
  echo "workspace version or kit label is invalid: $version / $label" >&2
  exit 1
}

tmp=$(mktemp -d)
worktree="$tmp/source"
cleanup() {
  git -C "$source_checkout" worktree remove --force "$worktree" >/dev/null 2>&1 || true
  rm -rf "$tmp"
}
trap cleanup EXIT
git -C "$source_checkout" worktree add --detach "$worktree" "$source_commit" >/dev/null

(
  cd "$worktree"
  scripts/build-kit.sh "$label"
)

kit="patch-$version-$label-linux-$(uname -m)"
kit_dir="$worktree/dist"
mkdir -p "$output_dir"
for file in "$kit.tar.gz" "$kit.tar.gz.sha256" "$kit-INSTALL.txt"; do
  [[ -f "$kit_dir/$file" ]] || {
    echo "build output is missing: $kit_dir/$file" >&2
    exit 1
  }
  install -m 0644 "$kit_dir/$file" "$output_dir/$file"
done

(cd "$output_dir" && sha256sum -c "$kit.tar.gz.sha256")
printf 'Built Patch %s label %s from commit %s\n' "$version" "$label" "$source_commit"
printf 'Three release files staged in %s\n' "$output_dir"
