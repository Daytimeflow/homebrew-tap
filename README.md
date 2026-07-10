# Daytimeflow Homebrew Tap

Homebrew packages maintained by [Daytimeflow](https://github.com/Daytimeflow).

## Codex Touch Bar Usage

Install the native Codex quota and token monitor for the MacBook Pro Touch Bar:

```bash
brew install --cask daytimeflow/tap/codex-touchbar-usage
```

Check status:

```bash
launchctl print gui/$(id -u)/com.local.codex-touchbar-helper
```

Upgrade:

```bash
brew update
brew upgrade --cask codex-touchbar-usage
```

Uninstall:

```bash
brew uninstall --cask codex-touchbar-usage
```

Project: [Daytimeflow/codex-touchbar-usage](https://github.com/Daytimeflow/codex-touchbar-usage)
