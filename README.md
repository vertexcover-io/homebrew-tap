# vertexcover-io/homebrew-tap

Homebrew formulae for:

- [samskara](https://github.com/vertexcover-io/samskara), the CLI that captures and searches AI coding-agent session logs.
- [yok](https://github.com/vertexcover-io/yok), which runs coding agents through a workflow, from ticket to PR.

## Install

```bash
brew trust vertexcover-io/tap
brew install vertexcover-io/tap/samskara
samskara --version

brew install vertexcover-io/tap/yok
yok plugin install --agent claude
```

Upgrade with `brew upgrade samskara` or `brew upgrade yok`. After a yok upgrade, run `yok plugin install --agent claude` again so the plugin matches the binary.

## How the formula stays current

`.github/workflows/bump.yml` runs every hour and can also be started by hand from the Actions tab. It reads the latest non-prerelease release of `vertexcover-io/samskara`. If that version differs from the one in `Formula/samskara.rb`, it downloads the release's `*-VERSION.tgz` asset, computes its sha256, rewrites `url` and `sha256`, and commits and pushes the change.

It uses only this repo's own `GITHUB_TOKEN`, so the samskara repo needs no secret and no step in its release workflow. A new release reaches `brew upgrade` within about an hour.

The formula installs the release tarball with npm and depends on `node@24`, not on the npm package's name. It pins `node@24` because the CLI's native SQLite module (`better-sqlite3` 11) does not compile against Node 26, the current `node` formula.

### yok

The `yok` job in the same workflow reads the latest version of `@vertexcover-io/yok` on npm. The yok repo is private, so the formula downloads the prebuilt binary from yok's npm platform packages (`@vertexcover-io/yok-darwin-arm64` and the other three), not from GitHub releases. On a new version it rewrites `version`, the four urls, and each url's `sha256`, then commits and pushes.
