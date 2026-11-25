# Release history

## 0.8.8 — 2026-11-25

Installing Patch no longer makes other audio apps crash. The installer added rtkit, and until you logged in again the system stopped apps whose sound thread worked hard for a moment (the terminal player cliamp closed a second after it started). Patch no longer installs it and gets real-time audio from the realtime group instead, the same as before after one login. The installer now ends with that last step: log out and back in once (or restart). Wallpapers & intros now show in Omarchy's wallpaper picker once they have downloaded (they were installed but missing); running the installer again fixes a computer that has them. Update with the same one line: `curl -fsSL https://get.patchaudio.app | bash`. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.8.8) for downloads and notes.

## 0.8.7 — 2026-11-23

Clearer messages when you enter a licence key. Everything from 0.8.6 is included. Update with the same one line: `curl -fsSL https://get.patchaudio.app | bash`. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.8.7) for downloads and notes.

## 0.8.6 — 2026-11-23

The Network Unit (key Z) sends the Program or an AUX to other machines on your network and plays their streams in Patch. Mic takes a call's far end with mix-minus and a browser's voice as a voice source; the Tidal Unit gets a real code editor that lights up as it plays; Broadcast sends the Performer's picture with RTMP. Plus fixes to the Mixer's send knobs, Mic sliders, deck loops, Broadcast and the audio clock. Update with the same one line: `curl -fsSL https://get.patchaudio.app | bash`. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.8.6) for downloads and notes.

## 0.8.5 — 2026-11-20

The first release of Patch. Choose how you use it (Standard, DJ, Podcast, Live coding or Everything) and add or remove modules later in Ctrl+K › Setup › Modules; big downloads such as the wallpapers run in the background. Install with `curl -fsSL https://get.patchaudio.app | bash`. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.8.5) for downloads and notes.

## 0.7.8-test.4 — 2026-11-06

Current x86_64 test kit. Updating now keeps your setup: Enter through the installer changes nothing. The bar's output and input rows work on the current Omarchy panel; windows redraw correctly after a resize; the Mixer, Analyzer, Meter and EQ fit better at small sizes; online tracks that are one finished file play on the decks. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.7.8-test.4) for downloads and notes.

## 0.7.8-test.3 — 2026-11-04

x86_64 test kit. Mixer channels appear faster and keep their place through a pause; the bar's health dot shows only problems you could hear; more backgrounds and layout improvements. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.7.8-test.3) for downloads and the [testing guide](docs/testing.md) for feedback instructions.

## 0.7.8-test.2 — 2026-10-30

x86_64 test kit for the committed Patch 0.7.8 build. See the [release page](https://github.com/novuon/patch-releases/releases/tag/v0.7.8-test.2) for downloads and the [testing guide](docs/testing.md) for feedback instructions.
