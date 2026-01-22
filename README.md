# dotfiles

Personal dotfiles for macOS development environment.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh/)
- Git

## What's included

| Tool | Description |
|------|-------------|
| Git | Version control config and aliases |
| Zsh | Shell config with sheldon plugins |
| Neovim | Editor with LSP and plugins |
| Ghostty | Terminal emulator |
| Starship | Shell prompt |
| Mise | Runtime version manager |
| Claude Code | AI assistant config |

## Install

```bash
git clone https://github.com/tic40/dotfiles ~/ghq/github.com/tic40/dotfiles
cd ~/ghq/github.com/tic40/dotfiles
make install
```

## Commands

```bash
make help     # Show all commands
make install  # Install all dotfiles
make clean    # Remove installed symlinks
```

## Individual install

```bash
make git       # ~/.gitconfig, ~/.gitignore_global
make zsh       # ~/.zshrc, ~/.config/sheldon/plugins.toml
make neovim    # ~/.config/nvim/
make ssh       # ~/.ssh/config
make ghostty   # ~/.config/ghostty/
make mise      # ~/.config/mise/
make starship  # ~/.config/starship.toml
make claude    # ~/.claude/
```

## SSH setup

SSH private key is not included in this repository. Copy your key manually:

```bash
cp /path/to/your/key ~/.ssh/github_tic40
chmod 600 ~/.ssh/github_tic40
```

## Local overrides

- `~/.zshrc.local` - Machine-specific shell config (sourced automatically)
- `~/.claude/settings.local.json` - Local Claude Code settings
