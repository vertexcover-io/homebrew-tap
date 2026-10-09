# vertexcover-io/homebrew-tap

Homebrew formulae for [samskara](https://github.com/vertexcover-io/samskara), the CLI that captures and searches AI coding-agent session logs.

## Install

```bash
brew trust vertexcover-io/tap
brew install vertexcover-io/tap/samskara
samskara --version
```

Upgrade with `brew upgrade samskara`.

## How the formula stays current

`.github/workflows/bump.yml` runs every hour and can also be started by hand from the Actions tab. It reads the latest non-prerelease release of `vertexcover-io/samskara`. If that version differs from the one in `Formula/samskara.rb`, it downloads the release's `*-VERSION.tgz` asset, computes its sha256, rewrites `url` and `sha256`, and commits and pushes the change.

It uses only this repo's own `GITHUB_TOKEN`, so the samskara repo needs no secret and no step in its release workflow. A new release reaches `brew upgrade` within about an hour.

The formula installs the release tarball with npm and depends on `node@24`, not on the npm package's name. It pins `node@24` because the CLI's native SQLite module (`better-sqlite3` 11) does not compile against Node 26, the current `node` formula.
