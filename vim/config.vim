"syntax
syntax enable

"encoding
set fileencoding=UTF-8

"tab rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"スクロールする時に下が見えるようにする
set scrolloff=3

".swap/バックアップファイルを作らない
set noswapfile
set nobackup

"バックスペースで各種消せるようにする
set backspace=indent,eol,start

"OSのクリップボードを使う
set clipboard=unnamed

"右下に表示される行・列の番号を表示する
set ruler

"移動コマンドを使ったとき、行頭に移動しない
set nostartofline

"対応括弧
set showmatch
set matchtime=1
set matchpairs+=<:>

"ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap

"インデントをshiftwidthの倍数に丸める
set shiftround

"補完の際の大文字小文字の区別しない
set infercase

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen

"search
set incsearch
set hlsearch
set ignorecase
set smartcase

"color
colorscheme murphy

"タイトルをウィンドウ枠に表示
set title
set titlestring=%F%m%r%h%w

"IME設定
set iminsert=0
set imsearch=0
set imdisable

"ステータスライン
set laststatus=2

"タブ補完
set wildmenu
set wildmode=list:longest

"コマンドを画面最下部に表示する
set showcmd

"タブ、空白、改行の不可視文字の可視化
set listchars=tab:»·,trail:·,extends:❯,precedes:❮,nbsp:␣,eol:↲

"delete white speace end of line when save the file
autocmd BufWritePre * :%s/\s\+$//ge

"remember last cursor position
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif
