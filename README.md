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
| Neovim | Editor with built-in `vim.pack`, Treesitter, blink.cmp and fzf-lua |
| Ghostty | Terminal emulator |
| Herdr | Terminal workspace manager for AI coding agents |
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
make herdr     # ~/.config/herdr/config.toml
make mise      # ~/.config/mise/
make starship  # ~/.config/starship.toml
make macos     # Apply macOS defaults (keyboard, Finder, Dock, battery %)
make claude    # ~/.claude/
```

## Neovim plugins

Plugins are managed by the built-in `vim.pack` (Neovim 0.12+) and declared in
`neovim/lua/plugins.lua`. Revisions are pinned in `neovim/nvim-pack-lock.json`;
missing plugins are installed at those revisions on first launch.

```vim
:lua vim.pack.update()   " review updates, then :write to apply or :quit to cancel
:lua vim.pack.del({ 'name' })   " remove a plugin after deleting it from plugins.lua
```

Commit `nvim-pack-lock.json` after updating.

## SSH setup

SSH private key is not included in this repository. Copy your key manually:

```bash
cp /path/to/your/key ~/.ssh/github_tic40
chmod 600 ~/.ssh/github_tic40
```

## Secrets setup

Secrets are not committed to this repository. Machine-specific tokens go in
`~/.zshrc.local` (sourced automatically by `~/.zshrc`, not tracked by git).

## Local overrides

- `~/.zshrc.local` - Machine-specific shell config and secrets (sourced automatically)
- `~/.claude/settings.local.json` - Local Claude Code settings
