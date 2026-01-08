.PHONY: help install all git zsh neovim ssh ghostty backup clean

DOTFILES := $(shell pwd)
BACKUP_DIR := ~/.dotfiles_backup/$(shell date +%Y%m%d_%H%M%S)

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: all ## Install all dotfiles (alias for all)

all: git zsh neovim ssh ghostty ## Install all dotfiles
	@echo "Done!"

git: ## Install git config
	@echo "Installing git config..."
	@ln -sf $(DOTFILES)/git/gitconfig ~/.gitconfig
	@ln -sf $(DOTFILES)/git/gitignore_global ~/.gitignore_global
	@echo "Git config installed"

zsh: ## Install zsh config
	@echo "Installing zsh config..."
	@if [ ! -d ~/.zplug ]; then \
		echo "Installing zplug..."; \
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	fi
	@ln -sf $(DOTFILES)/zsh/zshrc ~/.zshrc
	@echo "Zsh config installed"

neovim: ## Install neovim config
	@echo "Installing neovim config..."
	@mkdir -p ~/.config
	@rm -rf ~/.config/nvim
	@ln -sf $(DOTFILES)/neovim ~/.config/nvim
	@echo "Neovim config installed"

ssh: ## Install ssh config
	@echo "Installing ssh config..."
	@mkdir -p ~/.ssh
	@chmod 700 ~/.ssh
	@ln -sf $(DOTFILES)/ssh/config ~/.ssh/config
	@cp $(DOTFILES)/ssh/github_tic40 ~/.ssh/github_tic40
	@chmod 600 ~/.ssh/github_tic40
	@echo "SSH config installed"

ghostty: ## Install ghostty config
	@echo "Installing ghostty config..."
	@mkdir -p ~/.config/ghostty
	@ln -sf $(DOTFILES)/ghostty/config ~/.config/ghostty/config
	@echo "Ghostty config installed"

clean: ## Remove installed symlinks
	@echo "Removing symlinks..."
	@rm -f ~/.gitconfig
	@rm -f ~/.gitignore_global
	@rm -f ~/.zshrc
	@rm -rf ~/.config/nvim
	@rm -f ~/.ssh/config
	@rm -f ~/.config/ghostty/config
	@echo "Clean complete"
