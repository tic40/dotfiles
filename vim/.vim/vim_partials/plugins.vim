"" install vim plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"" install plugins command in vim
" :PlugInstall

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
"Plug 'plasticboy/vim-markdown'
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
"Plug 'fatih/vim-go'
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
" Gmailプラグイン
Plug 'yuratomo/gmail.vim'
" Twitterプラグイン
Plug 'basyura/twibill.vim'
Plug 'basyura/TweetVim'
" Slackプラグイン
Plug 'heavenshell/vim-slack'
" Vim syntax highlighting
Plug 'posva/vim-vue'
" typescript syntax highlight
Plug 'leafgarland/typescript-vim'
call plug#end()
