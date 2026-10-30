# Third-party notices

Patch is built with [Slint](https://slint.dev), PipeWire, SQLite and Rust
crates. The runtime kit includes a generated dependency license report and
the full license text for selected licenses. It also carries the two
vendored Signalsmith MIT licenses and Slint's Royalty-free Desktop, Mobile,
and Web Applications License 2.0.

Public tester kits use `PATCH_KIT=1`: the deck stretcher is vendored
Signalsmith Stretch and the kit does not link Rubber Band or FFTW. The
Slint royalty-free desktop license permits either an AboutSlint widget in
an About screen or a public webpage badge. Patch displays the widget in the
Controller's About tab, so release pages do not need the Slint logo. See the
[Slint license terms](https://slint.dev/terms-and-conditions#slint-royalty-free-license-20).

The normal private Arch build uses Rubber Band and FFTW under GPL-2.0-or-later
and Slint under GPL-3.0. That combined build is not distributed through this
public repository. The tester-kit licensing path does not change the normal
build's licensing or packaging.
