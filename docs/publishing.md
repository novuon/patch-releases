# Publish a test build

Builds are made in the private `novuon/Patch` repository. This public repository receives only explicitly selected release assets and public documentation. Never mirror the private repository, its branches, tags or commit history here.

## One-time setup in the private repository

1. Register a GitHub App owned by `novuon`, with webhooks disabled and repository **Contents: read and write** permission. Install it on **only `novuon/patch-releases`**.
2. Set repository variable `PUBLIC_RELEASE_APP_ID` to its App ID.
3. Set Actions secret `PUBLIC_RELEASE_APP_PRIVATE_KEY` to the App's private key. Keep that key out of this public repository and out of logs.
4. Set variable `PUBLIC_RELEASE_REPO` to `novuon/patch-releases`.
5. Use only the reviewed tester-kit route: `PATCH_KIT=1` selects MIT Signalsmith Stretch and skips Rubber Band/FFTW; Slint uses its royalty-free desktop license, with the `AboutSlint` widget in the Controller's About tab. The kit includes the selected dependency license inventory and full license texts. Then set `PUBLIC_BINARY_DISTRIBUTION_APPROVED=true` in the private repository. Do not use this approval for the normal Arch build, which links GPL libraries and requires its corresponding source.

The publishing token should be short-lived and limited to this public repository. Do not copy a personal account's broad GitHub CLI token into CI.

## Release flow

Use the private **Public test build** workflow with an existing version tag such as `v0.7.8-test.1`. The workflow validates that it is a tag, checks the committed version, runs tests and clippy, builds binary kits, verifies their allowlisted contents and saves private workflow artifacts.

Publication is opt-in. A publishing run requires the distribution gate and App credentials. It creates a **draft prerelease** with the complete kit, checksum, install notes and public build metadata. Review the draft in this repository, then publish it. The tag in this repository identifies the public documentation commit; it does not import a private source commit.

The current workflow builds x86_64 only. A failed build or license/archive check blocks publication. Release assets include the matching `omarchy-patch` and `patch-remote`, installer, runtime resources, license report and notices. The old private release workflow packages source; its artifacts must never be copied into this repository.

Do not upload application sources, Cargo files, private changelogs, development notes, CI logs, signing keys or raw library/test data. Build metadata may name the source commit hash and versions; it must not contain private source contents or paths.

## Manual upload from an already verified kit

Once distribution has been approved, an authorised maintainer can upload an already verified kit with `gh release create --repo novuon/patch-releases --draft --prerelease`, attaching its archive, checksum and install notes. Use public release notes written for testers rather than copying the private changelog.
