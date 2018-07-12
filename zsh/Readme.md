# ref
https://medium.freecodecamp.org/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerline fonts
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh

# set powerline fonts
Open ITerm2 > Preferences > Profiles > Text > Change Font and set it to something that has “for Powerline”. I’m choosing “Meslo LG DZ for Powerline” font.

# Change the Theme to “agnoster”
$ vi ~/.zshrc
Set ZSH_THEME="agnoster" and save the file

# Add zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add ZSH-AutoSuggestion Plugin
$ git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Add plugins
$ vi ~/.zshrc
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

$ source ~/.zshrc

# alias
alias vi='vim'
alias cl='clear'
alias diff='colordiff'
alias ls='ls -G'
alias ll='ls -alG'
alias repo=''
#alias ls='ls --color'
#alias ll='ls -al --color'

# script
# for nvm
if [[ -s ~/.nvm/nvm.sh ]]; then
  source ~/.nvm/nvm.sh
fi

# for rbvenv
eval "$(rbenv init -)"
