export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=ja_JP.UTF-8

# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd
setopt auto_pushd
setopt correct

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# color
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# for nvm
if [[ -s ~/.nvm/nvm.sh ]]; then
  source ~/.nvm/nvm.sh
fi

# for rbvenv
eval "$(rbenv init -)"
