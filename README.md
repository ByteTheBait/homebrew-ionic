# Homebrew tap for Ionic

Install the [Ionic](https://github.com/ByteTheBait/Ionic-Compiler) compiler
on macOS / Apple Silicon:

```sh
brew install bytethebait/ionic/ionic
ionic myfile.ionic -o myfile && ./myfile
```

Upgrades: `brew upgrade ionic`. Replaces the v0.0.6-era binary in `/opt/homebrew/bin`.

This tap is auto-updated by the upstream release workflow — every tagged
release of ByteTheBait/Ionic-Compiler dispatches a `new-release` event
that rewrites `Formula/ionic.rb` with the new version + aarch64 sha256.
The receiving workflow lives at `.github/workflows/update-formula.yml`
on the default branch of this repo.
