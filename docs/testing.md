# Test and report

Install a named prerelease and record its version:

```bash
omarchy-patch --version
```

Check the parts you use: system audio and routing, mixer controls, deck loading and transport, recording, or layouts. Include both an action and its result: what you did, what happened, and what you expected.

A useful report includes:

- The complete Patch version and build identifier.
- Omarchy / Hyprland version, CPU architecture and audio device.
- Steps that reproduce the problem.
- Whether playback was active and which layout was open.
- Relevant error text, or a short screenshot/recording when it helps.

For audio problems, these read-only commands can help:

```bash
omarchy-patch engine status
omarchy-patch status
```

Review logs before posting: remove private paths, track names or account details you do not want public. Share a music file only if you have permission to distribute it.

[Report a bug](https://github.com/novuon/patch-releases/issues/new?template=bug_report.yml) or [share feedback](https://github.com/novuon/patch-releases/issues/new?template=test_feedback.yml).

If a problem appears after an update, include the last version that worked. Keep the previous kit so you can return to it using the [installation notes](installation.md).
