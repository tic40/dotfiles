""install vim plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" Add plugins to &runtimepath
Plug 'VimClojure'
Plug 'jpalardy/vim-slime'
Plug 'mattn/emmet-vim'
Plug 'tell-k/vim-browsereload-mac'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'toyamarinyon/vim-swift'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
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
Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=1
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=14
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=3
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_guide_size = 1
" Vim非同期処理ライブラリ
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" コーディング中のプログラムをvimから起動
Plug 'thinca/vim-quickrun'
" JavaScript用プラグイン
Plug 'pangloss/vim-javascript'
" JavaScript Syntaxチェック
Plug 'jelera/vim-javascript-syntax'
" CoffeeScript用
Plug 'kchmck/vim-coffee-script'
" node.js用
Plug 'moll/vim-node'
" スニペット
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" Markdownプラグイン
Plug 'plasticboy/vim-markdown'
" Rubyプラグイン
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" コメントアウトプラグイン
Plug 'tomtom/tcomment_vim'
" HTMLタグハイライト
Plug 'gregsexton/matchtag'
" PHPプラグイン
Plug 'stanangeloff/php.vim'
" ブラウザを開く
Plug 'tyru/open-browser.vim'
" Macのみブラウザをリロード
Plug 'tell-k/vim-browsereload-mac'
" Pythonプラグイン
Plug 'davidhalter/jedi-vim'
" Goプラグイン
Plug 'fatih/vim-go'
" JSONプラグイン
Plug 'leshill/vim-json'
" Angular.jsプラグイン
Plug 'burnettk/vim-angular'
" 入力補完
Plug 'shougo/neocomplete.vim'
" Scalaプラグイン
Plug 'derekwyatt/vim-scala'
" Swiftプラグイン
Plug 'keith/swift.vim'
" WordPressプラグイン
Plug 'dsawardekar/wordpress.vim'
" CSVプラグイン
Plug 'chrisbra/csv.vim'
" HTML5プラグイン
Plug 'othree/html5.vim'
" GitHubプラグイン
Plug 'junegunn/vim-github-dashboard'
Plug 'mattn/gist-vim'
" IDEプラグイン
Plug 'scrooloose/syntastic'
" 絵文字プラグイン
Plug 'junegunn/vim-emoji'
" 非同期にシェルを実行
Plug 'Shougo/vimshell'
" vimの文字列を別ペインに転送
Plug 'jpalardy/vim-slime'
" シンタックスチェック
Plug 'scrooloose/syntastic'
" yankしているものを入れ替え
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
" ソースコードを実行
Plug 'thinca/vim-quickrun'
" 接続サーバーを選択
Plug 'shougo/neossh.vim'
" ステータスライン・タブライン
Plug 'itchyny/lightline.vim'
" 辞書読み込み
Plug 'thinca/vim-ref'
" cs'" で'を"に置換 cs'<p>と打ち込むと、'文字列を<p>タグで囲む
Plug 'tpope/vim-surround'
" git操作
Plug 'tpope/vim-fugitive'
" R言語用プラグイン
Plug 'vim-scripts/Vim-R-plugin'
" Hive用プラグイン
Plug 'autowitch/hive.vim'
" インデントに色をつける
Plug 'nathanaelkane/vim-indent-guides'
" 末尾の空白対策
Plug 'bronson/vim-trailing-whitespace'
" PHP補完用
Plug 'violetyk/neocomplete-php.vim'
" はてなブログ投稿
Plug 'mattn/webapi-vim'
Plug 'moznion/hateblo.vim'
" Gmailプラグイン
Plug 'yuratomo/gmail.vim'
" Twitterプラグイン
Plug 'basyura/twibill.vim'
Plug 'basyura/TweetVim'
" Slackプラグイン
Plug 'heavenshell/vim-slack'
call plug#end()

"tab rules
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0

" 構文チェック
syntax enable
" エンコーディング
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ビープ音を消す
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
" 文字がない場所にもカーソルを移動できるようにする
    "set virtualedit=all
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
:set hlsearch
" 行頭の余白内で Tab を打ち込むとshiftwidthの数だけインデントする
set smarttab
" autoindentと同様だがC構文を認識
set smartindent
" カラー設定
set t_Co=256
set background=dark
colorscheme murphy
    "let g:solarized_termcolors=256
    "set listchars=eol:¬,tab:▸\
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
    "set list
set listchars=tab:>-,extends:<,trail:-
"show number/ruler
set ruler
set backspace=indent,eol,start
"paste no autoindent
set paste

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

" remember last cursor position
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
