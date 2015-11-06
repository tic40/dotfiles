set nocompatible
filetype off

"if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	"endif
	" originalrepos on github
	NeoBundle 'Shougo/neobundle.vim'
	NeoBundle 'Shougo/vimproc'
	NeoBundle 'VimClojure'
	NeoBundle 'Shougo/vimshell'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'jpalardy/vim-slime'

	NeoBundle 'mattn/emmet-vim'
	NeoBundle 'tell-k/vim-browsereload-mac'
	NeoBundle 'hail2u/vim-css3-syntax'
	NeoBundle 'taichouchou2/vim-javascript'
	NeoBundle 'kchmck/vim-coffee-script'

	" ファイルをtree表示してくれる
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'scrooloose/syntastic'
	let g:syntastic_enable_signs=1
	let g:syntastic_auto_loc_list=2
	let g:syntastic_mode_map = {'mode': 'passive'} 
	augroup AutoSyntastic
		autocmd!
		"autocmd InsertLeave,TextChanged * call s:syntastic() 
	augroup END
	function! s:syntastic()
		w
		SyntasticCheck
	endfunction

	" インデントに色を付けて見やすくする
	NeoBundle 'nathanaelkane/vim-indent-guides'
	let g:indent_guides_enable_on_vim_startup=1
	let g:indent_guides_start_level=1
	let g:indent_guides_auto_colors=0
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=14
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=3
	let g:indent_guides_color_change_percent = 30
	let g:indent_guides_guide_size = 1

call neobundle#end()



filetype plugin indent on
filetype indent on
syntax on

"encoding
set encoding=utf-8
set fileencoding=utf-8

"tab
set tabstop=4
set shiftwidth=4

"encoding
set encoding=utf-8

"colorTheme
colorschem murphy

"backup
set nobackup

"indent
set smartindent
set autoindent

"show cursorline
set cursorline

"window title
set title

"show filename
set statusline+=%<%F

"swap file
set noswapfile

"タブ、空白、改行の可視化
"set list
set listchars=tab:>-,extends:<,trail:-
"set listchars=tab:>-,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

"highlight search result
set hlsearch

"show number/ruler
set ruler

set backspace=indent,eol,start

"paste no autoindent
set paste

" remember last cursor position
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

augroup PHP
	autocmd!
	autocmd FileType php set makeprg=php\ -l\ %
	" php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
	autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
augroup END
