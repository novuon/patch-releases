# Build and publish a test kit

Build test kits on the maintainer's machine from an exact, committed source tag in the private `novuon/Patch` checkout. This public repository provides the build wrapper and stores the release assets. No GitHub Actions build is used.

The application source remains private. The public release tag points to a deliberately minimal Git tree containing exactly three files: the kit `.tar.gz`, its `.sha256` checksum and the `-INSTALL.txt` instructions. GitHub's generated **Source code (zip)** and **Source code (tar.gz)** downloads are snapshots of that three-file tree.

## Build locally

Requirements are the Patch build prerequisites in the private repository's `AGENTS.md`, a clean public release checkout, and a clean private source checkout containing the exact source commit. Use its full commit hash so the build does not depend on a moving branch or create a private `*-test.*` tag that starts GitHub Actions.

From this repository's root, run:

```bash
scripts/build-test-kit.sh /path/to/Patch 7de5c8a65e6c4b054ad2a5c7e76b5323c05f816f test.2 dist/v0.7.8-test.2
```

The wrapper checks out that exact source commit in a temporary worktree, runs its committed `scripts/build-kit.sh` locally, verifies the checksum, and stages only the kit archive, checksum and install instructions under `dist/<kit-label>/`. The wrapper does not alter the source checkout or start a GitHub Actions workflow.

Review the staged files and build identifier. Then create or update the public tag snapshot:

```bash
scripts/tag-test-kit-snapshot.sh v0.7.8-test.2 dist/v0.7.8-test.2
```

For a deliberate correction to a tag that already exists, pass `--replace-tag`. This force-updates that tag so the generated GitHub source archives contain the three files from the corrected kit. Verify the tag tree before editing the corresponding GitHub Release.

Create or update a draft prerelease in `novuon/patch-releases`, attach exactly those three files, and review the page. Publish the prerelease after confirming the named downloads and generated source archives show the expected kit. Keep the release notes neutral and link users to the named kit archive and checksum.

## License and distribution

`PATCH_KIT=1` selects MIT Signalsmith Stretch and skips Rubber Band/FFTW. Slint uses its royalty-free desktop license; its required `AboutSlint` widget appears in the Controller's About tab. The kit carries the selected dependency license inventory and full license texts. Do not distribute the normal Arch build through this repository: it links GPL libraries and requires its corresponding source.

Never copy application source, Cargo files, private changelogs, development notes, CI logs, signing keys or raw library/test data into the public repository or release tag. The release-tag snapshot is limited to the three generated kit files.
