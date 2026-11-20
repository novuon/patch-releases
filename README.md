# Patch

Patch is the audio environment for Omarchy: Patch becomes your system's sound, with a mixer, EQ, meters, routing, recording, DJ decks, a visualiser, podcast and live-coding tools.

Patch 0.8.5 is the first release.

## Install

```bash
curl -fsSL https://get.patchaudio.app | bash
```

The installer downloads the newest release from this repository's [Releases](https://github.com/novuon/patch-releases/releases), checks its SHA-256 and asks how you use Patch: Standard (your sound, the Mixer and the EQ), DJ, Podcast, Live coding, Everything or Custom. Add or remove modules later with Ctrl+K, Setup, Modules. Details and the manual download: [Install Patch](docs/installation.md).

## Auto Mix

Auto Mix, the AI DJ that plans and mixes a set from your own music, is coming soon. Leave your email at [patchaudio.app/auto-mix](https://patchaudio.app/auto-mix) to hear when it's available.

## Source code

Patch's code is open source (MIT): [novuon/patch-audio](https://github.com/novuon/patch-audio).

## Start here

- [Install, update or remove Patch](docs/installation.md)
- [Report a bug](https://github.com/novuon/patch-releases/issues/new?template=bug_report.yml)
- [Share feedback](https://github.com/novuon/patch-releases/issues/new?template=test_feedback.yml)
- [Release history](CHANGELOG.md)

## Supported machines

Omarchy on Arch Linux with Hyprland 0.56 or newer, `x86_64`. ARM, Windows and macOS builds are not provided.

A release contains the compiled application, its installer and runtime resources, checksums and build provenance; the module downloads (themes, wallpapers) and their signed list are separate release files. The source code is at [novuon/patch-audio](https://github.com/novuon/patch-audio).

## Distribution

Releases use the `PATCH_KIT=1` build, which selects MIT Signalsmith Stretch and does not link GPL-licensed Rubber Band or FFTW. The desktop application uses Slint under its royalty-free desktop license and displays the required attribution in the Controller's About tab. Each kit includes its applicable licence and third-party notices. See [third-party notices](THIRD_PARTY_NOTICES.md).

[Maintainer publishing setup](docs/publishing.md)
