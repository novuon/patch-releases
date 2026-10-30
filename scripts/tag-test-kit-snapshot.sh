#!/usr/bin/env bash
# Make a release tag whose generated GitHub source archives contain only the
# kit archive, its checksum, and its install instructions.
set -euo pipefail

usage() {
  echo "Usage: $0 <release-tag> <directory-with-three-kit-files> [--replace-tag]" >&2
  exit 2
}

[[ $# -ge 2 && $# -le 3 ]] || usage
release_tag=$1
artifact_dir=$(realpath "$2")
replace_tag=${3:-}
[[ -z $replace_tag || $replace_tag == --replace-tag ]] || usage
public_repo=$(git -C "$(dirname "$0")/.." rev-parse --show-toplevel)
archive=$(find "$artifact_dir" -maxdepth 1 -type f -name 'patch-*.tar.gz' ! -name '*.sha256' -printf '%f\n' -quit)
[[ -n $archive ]] || {
  echo "kit archive not found in $artifact_dir" >&2
  exit 1
}
release_version=${release_tag#v}
release_version=${release_version%%-*}
case "$archive" in
  "patch-$release_version-"*"-linux-"*.tar.gz) ;;
  *)
  echo "kit archive does not match release tag $release_tag: $archive" >&2
  exit 1
  ;;
esac
files=("$archive" "$archive.sha256" "${archive%.tar.gz}-INSTALL.txt")
for file in "${files[@]}"; do
  [[ -f "$artifact_dir/$file" ]] || {
    echo "required kit file is missing: $artifact_dir/$file" >&2
    exit 1
  }
done
[[ $(find "$artifact_dir" -maxdepth 1 -type f | wc -l) -eq 3 ]] || {
  echo "artifact directory must contain exactly the archive, checksum, and INSTALL.txt" >&2
  exit 1
}
git -C "$public_repo" diff --quiet
[[ -z $(git -C "$public_repo" status --porcelain) ]] || {
  echo "public release checkout must be clean before tagging" >&2
  exit 1
}

if git -C "$public_repo" show-ref --verify --quiet "refs/tags/$release_tag"; then
  [[ $replace_tag == --replace-tag ]] || {
    echo "tag already exists; pass --replace-tag only when intentionally retargeting it" >&2
    exit 1
  }
fi

tree=$(
  for file in "${files[@]}"; do
    blob=$(git -C "$public_repo" hash-object -w "$artifact_dir/$file")
    printf '100644 blob %s\t%s\n' "$blob" "$file"
  done | LC_ALL=C sort | git -C "$public_repo" mktree
)
parent=$(git -C "$public_repo" rev-parse origin/main)
commit=$(printf 'Test kit files for %s\n' "$release_tag" \
  | git -C "$public_repo" commit-tree "$tree" -p "$parent")

if [[ $replace_tag == --replace-tag ]]; then
  git -C "$public_repo" tag -f "$release_tag" "$commit" >/dev/null
  git -C "$public_repo" push --force origin "refs/tags/$release_tag"
else
  git -C "$public_repo" tag "$release_tag" "$commit"
  git -C "$public_repo" push origin "refs/tags/$release_tag"
fi

printf 'Release tag %s now contains exactly:\n' "$release_tag"
printf '  %s\n' "${files[@]}"
