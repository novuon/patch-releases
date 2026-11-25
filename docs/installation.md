# Install Patch

The quickest way:

```bash
curl -fsSL https://get.patchaudio.app | bash
```

It downloads the newest release for your machine from [Releases](https://github.com/novuon/patch-releases/releases), checks its SHA-256 and runs its installer. Arguments go to the installer, for example `curl -fsSL https://get.patchaudio.app | bash -s -- --profile dj`. The manual way follows.

## Requirements

- Omarchy (Arch Linux with Hyprland 0.56 or newer), or another Linux distribution with PipeWire: Ubuntu 24.04 and newer, Linux Mint 22, Debian 13, Fedora 40 and newer, openSUSE Tumbleweed, or Arch.
- A PC (x86_64) or 64-bit ARM (aarch64), as `uname -m` shows.
- Sudo access to install the packages Patch needs (with pacman, apt, dnf or zypper).

Each release has four kits; the one-line installer picks yours:

| | PC (x86_64) | ARM (aarch64) |
|---|---|---|
| Omarchy | `patch-VERSION-linux-x86_64` | `patch-VERSION-linux-aarch64` |
| Any other distribution | `patch-VERSION-linux-generic-x86_64` | `patch-VERSION-linux-generic-aarch64` |

## Download and verify

1. Open [Releases](https://github.com/novuon/patch-releases/releases) and choose a version.
2. Download the matching `.tar.gz` and its `.tar.gz.sha256` file into the same folder. Also keep the `-INSTALL.txt` instructions.
3. Check the filename in the following commands against the actual download:

   ```bash
   sha256sum -c patch-VERSION-linux-x86_64.tar.gz.sha256
   tar -xzf patch-VERSION-linux-x86_64.tar.gz
   cd patch-VERSION
   ./install.sh
   ```

The installer asks how you use Patch (Standard, DJ, Podcast, Live coding, Everything or Custom), which modules come with it, and your default window layout. It installs the packages Patch needs with your system's package manager. Every setup includes the Patch themes with four wallpapers each; the other wallpapers and their intros download from the release when you add the Wallpapers module.

With an AI agent or a script there is no terminal for the setup screen: a first install then lists the setups and stops without changing anything. Run it with `--profile standard|dj|podcast|live_coding|full` or `--modules a,b,…` (the list it prints).

Then log out and back in once (or restart); the installer ends by saying so when it is needed. Patch works right away, but real-time audio, which keeps the sound steady when the computer is busy, starts with your next login. At login the audio service may start according to setup; Patch's windows do not open automatically.

The archive includes readable installer and runtime helper scripts. The application source repository remains private.

## Update

Run the newest installer again (`curl -fsSL https://get.patchaudio.app | bash`, or a downloaded kit's `./install.sh`) without uninstalling first. Enter through its screens keeps your setup; Patch keeps its library and settings.

## Roll back

Close Patch's windows and stop playback when convenient, then run the previous kit's installer. A version downgrade can require compatible library and settings formats; check both releases' notes first. Keep a backup before testing a build that changes stored data.

## Remove Patch

From the extracted kit:

```bash
./uninstall.sh
```

This restores your system's own audio setup. The optional `--purge` flag also removes Patch's library and settings; use it only if you intend to remove those.
