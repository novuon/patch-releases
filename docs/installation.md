# Install Patch

The quickest way:

```bash
curl -fsSL https://get.patchaudio.app | bash
```

It downloads the newest release for your machine from [Releases](https://github.com/novuon/patch-releases/releases), checks its SHA-256 and runs its installer. Arguments go to the installer, for example `curl -fsSL https://get.patchaudio.app | bash -s -- --profile dj`. The manual way follows.

## Requirements

- Omarchy / Arch Linux, with Hyprland 0.56 or newer.
- A matching CPU architecture (`uname -m`).
- Sudo access to install the Arch packages Patch needs.

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

The installer asks how you use Patch (Standard, DJ, Podcast, Live coding, Everything or Custom), which modules come with it, your default window layout and, with Auto Mix, your subscription key (or add it later). It installs the Arch packages Patch needs. Themes and wallpapers download from the release when you choose them; Auto Mix's stem separator downloads once its subscription is active.

Log out and back in if the installer asks, so real-time scheduling permissions take effect. At login the audio service may start according to setup; Patch's windows do not open automatically.

The archive includes readable installer and runtime helper scripts. The application source repository remains private.

## Update

Run the newest installer again (`curl -fsSL https://get.patchaudio.app | bash`, or a downloaded kit's `./install.sh`) without uninstalling first. Enter through its screens keeps your setup; Patch keeps its library, settings and subscription.

## Roll back

Close Patch's windows and stop playback when convenient, then run the previous kit's installer. A version downgrade can require compatible library and settings formats; check both releases' notes first. Keep a backup before testing a build that changes stored data.

## Remove Patch

From the extracted kit:

```bash
./uninstall.sh
```

This restores Omarchy's own audio setup. The optional `--purge` flag also removes Patch's library and settings; use it only if you intend to remove those.
