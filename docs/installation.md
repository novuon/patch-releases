# Install a test build

These instructions apply to the test kits attached to the [public releases](https://github.com/novuon/patch-releases/releases).

## Requirements

- Omarchy / Arch Linux, with Hyprland 0.56 or newer.
- A matching CPU architecture (`uname -m`).
- Sudo access to install the Arch packages Patch needs.

## Download and verify

1. Open [Releases](https://github.com/novuon/patch-releases/releases) and choose a test version.
2. Download the matching `.tar.gz` and its `.tar.gz.sha256` file into the same folder. Also keep the `-INSTALL.txt` instructions.
3. Check the filename in the following commands against the actual download:

   ```bash
   sha256sum -c patch-VERSION-LABEL-linux-x86_64.tar.gz.sha256
   tar -xzf patch-VERSION-LABEL-linux-x86_64.tar.gz
   cd patch-VERSION
   ./install.sh
   ```

The installer offers Minimal, Full or Custom and a default window layout. It can install required packages and the optional stem separator.

Log out and back in if the installer asks, so real-time scheduling permissions take effect. At login the audio service may start according to setup; Patch's windows do not open automatically.

The archive includes readable installer and runtime helper scripts. The application source repository remains private.

## Update

Keep the previous kit. Run the new kit's installer without uninstalling first. Patch keeps its library and settings. An engine handover can depend on playback state; follow the installer's output rather than assuming a test update is interruption-free.

## Roll back

Close Patch's windows and stop playback when convenient, then run the previous kit's installer. A version downgrade can require compatible library and settings formats; check both releases' notes first. Keep a backup before testing a build that changes stored data.

## Remove Patch

From the extracted kit:

```bash
./uninstall.sh
```

This restores Omarchy's own audio setup. The optional `--purge` flag also removes Patch's library and settings; use it only if you intend to remove those.
