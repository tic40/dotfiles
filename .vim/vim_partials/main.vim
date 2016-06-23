"tab rules
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0

" syntax
syntax enable

" encoding
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

" スクロールする時に下が見えるようにする
set scrolloff=5

" .swapファイルを作らない
set noswapfile

" バックアップファイルを作らない
set nowritebackup
set nobackup

" バックスペースで各種消せるようにする
set backspace=indent,eol,start

" delete beep sound
set vb t_vb=
set novisualbell

" OSのクリップボードを使う
set clipboard=unnamed,autoselect

" 右下に表示される行・列の番号を表示する
set ruler

" compatibleオプションをオフにする
set nocompatible

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" 対応括弧をハイライト表示する
set showmatch

" 対応括弧の表示秒数を3秒にする
set matchtime=3

" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap

" インデントをshiftwidthの倍数に丸める
set shiftround

" 補完の際の大文字小文字の区別しない
set infercase

" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen

" 小文字の検索でも大文字も見つかるようにする
set ignorecase

" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase

" インクリメンタルサーチを行う
set incsearch

" 検索結果をハイライト表示
set hlsearch

" 行頭の余白内で Tab を打ち込むとshiftwidthの数だけインデントする
set smarttab

" autoindentと同様だがC構文を認識
set smartindent

" カラー設定
set t_Co=256
set background=dark
colorscheme murphy

" タイトルをウィンドウ枠に表示
set title
set undolevels=300

" コマンド・検索パターンの履歴
set history=10000

" IME設定
set iminsert=0
set imsearch=0
set imdisable

" ステータスライン
set laststatus=2

" メッセージ表示欄
set cmdheight=2

" 置換の時 g オプションをデフォルトで有効にする
set gdefault

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" コマンドを画面下に表示させる
set showcmd

" タブ補完
set wildmenu
set wildmode=list:longest
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan

" マウス対応
set mouse=a
set ttymouse=xterm2

" コマンドを画面最下部に表示する
set showcmd

"タブ、空白、改行の不可視文字の可視化
set listchars=tab:>-,extends:<,trail:-

" paste
set paste
