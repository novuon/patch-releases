# Patch — test builds

Patch is an audio environment for Omarchy: routing, mixing, metering, recording, DJ decks, an AI DJ and a visualiser.

This repository holds public test downloads, installation notes and feedback. Patch's application source and build workflows remain in a separate private repository.

**Patch 0.7.8 test.1** is available for x86_64 testing. Download it from [Releases](https://github.com/novuon/patch-releases/releases). Test builds are marked **Pre-release**; choose a version explicitly rather than using GitHub's latest-release link.

## Start here

- [Install or update a test build](docs/installation.md)
- [What to test and how to report a problem](docs/testing.md)
- [Report a bug](https://github.com/novuon/patch-releases/issues/new?template=bug_report.yml)
- [Share test feedback](https://github.com/novuon/patch-releases/issues/new?template=test_feedback.yml)
- [Release history](CHANGELOG.md)

## Supported machines

Omarchy on Arch Linux with Hyprland 0.56 or newer. Builds are for `x86_64` only; ARM, Windows and macOS builds are not currently provided.

A kit contains the compiled application, installer and runtime resources. It includes checksums and build provenance. It does not contain the private source repository.

## Distribution

Public tester kits use the `PATCH_KIT=1` build, which selects MIT Signalsmith Stretch and does not link GPL-licensed Rubber Band or FFTW. The desktop application uses Slint under its royalty-free desktop license and displays the required attribution in the Controller's About tab. Each kit includes its applicable licence and third-party notices. This path applies to public tester kits only. See [third-party notices](THIRD_PARTY_NOTICES.md).

[Maintainer publishing setup](docs/publishing.md)
