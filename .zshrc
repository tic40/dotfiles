setopt auto_cd
setopt auto_pushd
setopt correct

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

PATH="$PATH":~/.composer/vendor/bin/

# 環境変数
export LANG=ja_JP.UTF-8

# color
autoload -Uz colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# ----- PROMPT -----
## PROMPT
PROMPT=$'[%*]'"%F{green}${HOST}%f "
## RPROMPT
RPROMPT=$'`branch-status-check` %~' # %~はpwd
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

# {{{ methods for RPROMPT
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
autoload -U colors; colors
function branch-status-check {
	local prefix branchname suffix
		# .gitの中だから除外
		if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
			return
		fi
		branchname=`get-branch-name`
		# ブランチ名が無いので除外
		if [[ -z $branchname ]]; then
			return
		fi
		prefix=`get-branch-status` #色だけ返ってくる
		suffix='%{'${reset_color}'%}'
		echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
	# gitディレクトリじゃない場合のエラーは捨てる
	echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
	local res color
		output=`git status --short 2> /dev/null`
		if [ -z "$output" ]; then
			res=':' # status Clean
			color='%{'${fg[green]}'%}'
		elif [[ $output =~ "[\n]?\?\? " ]]; then
			res='?:' # Untracked
			color='%{'${fg[yellow]}'%}'
		elif [[ $output =~ "[\n]? M " ]]; then
			res='M:' # Modified
			color='%{'${fg[red]}'%}'
		else
			res='A:' # Added to commit
			color='%{'${fg[cyan]}'%}'
		fi
		# echo ${color}${res}'%{'${reset_color}'%}'
		echo ${color} # 色だけ返す
}

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# default directory

# alias command
alias vi='vim'
alias lla='ls -al'
alias cl='clear'
alias diff='colordiff'
alias ls='ls -G'
alias ll='ls -G'
