.PHONY: help install all git zsh neovim ssh ghostty herdr mise starship claude macos clean

DOTFILES := $(CURDIR)

# $(call link,src,dest): back up dest if it is a real file/dir, then symlink
define link
	@if [ -e "$(2)" ] && [ ! -L "$(2)" ]; then \
	  bak="$(2).bak.$$(date +%Y%m%d%H%M%S)"; mv "$(2)" "$$bak"; echo "  backed up $(2) -> $$bak"; \
	fi
	@ln -sfn "$(1)" "$(2)"
endef

LINKS := \
  ~/.gitconfig ~/.gitignore_global \
  ~/.zshrc ~/.config/sheldon/plugins.toml \
  ~/.config/nvim \
  ~/.ssh/config \
  ~/.config/ghostty/config \
  ~/.config/herdr/config.toml \
  ~/.config/mise/config.toml ~/.default-gems \
  ~/.config/starship.toml \
  ~/.claude/CLAUDE.md ~/.claude/settings.json ~/.claude/rules ~/.claude/skills

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: all ## Install all dotfiles (alias for all)

all: git zsh neovim ssh ghostty herdr mise starship claude ## Install all dotfiles
	@echo "Done!"

git: ## Install git config
	@echo "Installing git config..."
	$(call link,$(DOTFILES)/git/gitconfig,$(HOME)/.gitconfig)
	$(call link,$(DOTFILES)/git/gitignore_global,$(HOME)/.gitignore_global)
	@echo "Git config installed"

zsh: ## Install zsh config
	@echo "Installing zsh config..."
	$(call link,$(DOTFILES)/zsh/zshrc,$(HOME)/.zshrc)
	@mkdir -p ~/.config/sheldon
	$(call link,$(DOTFILES)/sheldon/plugins.toml,$(HOME)/.config/sheldon/plugins.toml)
	@echo "Zsh config installed"

neovim: ## Install neovim config
	@echo "Installing neovim config..."
	@mkdir -p ~/.config
	$(call link,$(DOTFILES)/neovim,$(HOME)/.config/nvim)
	@echo "Neovim config installed"

ssh: ## Install ssh config
	@echo "Installing ssh config..."
	@mkdir -p ~/.ssh
	@chmod 700 ~/.ssh
	$(call link,$(DOTFILES)/ssh/config,$(HOME)/.ssh/config)
	@echo "SSH config installed"
	@echo "NOTE: Copy your SSH private key manually to ~/.ssh/github_tic40"

ghostty: ## Install ghostty config
	@echo "Installing ghostty config..."
	@mkdir -p ~/.config/ghostty
	$(call link,$(DOTFILES)/ghostty/config,$(HOME)/.config/ghostty/config)
	@echo "Ghostty config installed"

herdr: ## Install herdr config
	@echo "Installing herdr config..."
	@mkdir -p ~/.config/herdr
	$(call link,$(DOTFILES)/herdr/config.toml,$(HOME)/.config/herdr/config.toml)
	@echo "Herdr config installed"

mise: ## Install mise config
	@echo "Installing mise config..."
	@mkdir -p ~/.config/mise
	$(call link,$(DOTFILES)/mise/config.toml,$(HOME)/.config/mise/config.toml)
	$(call link,$(DOTFILES)/mise/default-gems,$(HOME)/.default-gems)
	@echo "Mise config installed"

starship: ## Install starship config
	@echo "Installing starship config..."
	@mkdir -p ~/.config
	$(call link,$(DOTFILES)/starship/starship.toml,$(HOME)/.config/starship.toml)
	@echo "Starship config installed"

claude: ## Install Claude Code config
	@echo "Installing Claude Code config..."
	@mkdir -p ~/.claude
	$(call link,$(DOTFILES)/claude/CLAUDE.md,$(HOME)/.claude/CLAUDE.md)
	$(call link,$(DOTFILES)/claude/settings.json,$(HOME)/.claude/settings.json)
	$(call link,$(DOTFILES)/claude/rules,$(HOME)/.claude/rules)
	$(call link,$(DOTFILES)/claude/skills,$(HOME)/.claude/skills)
	@echo "Registering user-scope MCP servers (tokens read from env at runtime)..."
	@command -v claude >/dev/null 2>&1 && { \
	  claude mcp remove -s user trello >/dev/null 2>&1 || true; \
	  claude mcp add-json -s user trello '{"type":"stdio","command":"pnpm","args":["dlx","@delorenj/mcp-server-trello"],"env":{"TRELLO_API_KEY":"$${TRELLO_API_KEY}","TRELLO_TOKEN":"$${TRELLO_TOKEN}"}}' && \
	  echo "  trello registered (set TRELLO_API_KEY / TRELLO_TOKEN in ~/.zshrc.local)"; \
	} || echo "  claude CLI not found, skipped MCP registration"
	@echo "Claude Code config installed"

macos: ## Apply macOS defaults (not included in all)
	@bash $(DOTFILES)/macos/defaults.sh

clean: ## Remove installed symlinks (real files are left untouched)
	@echo "Removing symlinks..."
	@for f in $(LINKS); do \
	  if [ -L "$$f" ]; then rm "$$f"; elif [ -e "$$f" ]; then echo "  skipped (not a symlink): $$f"; fi; \
	done
	@echo "Clean complete"
