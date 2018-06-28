call plug#begin('~/.vim/plugged')
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=14
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=3
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1

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
" Vim非同期処理ライブラリ
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" スニペット
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" emmet
Plug 'mattn/emmet-vim'
" ブラウザを開く
Plug 'tyru/open-browser.vim'
" 入力補完
Plug 'shougo/neocomplete.vim'
" HTMLハイライト
Plug 'gregsexton/matchtag'
" HTML5
Plug 'othree/html5.vim'
" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" PHP
Plug 'stanangeloff/php.vim'
" Python
Plug 'davidhalter/jedi-vim'
" Go
Plug 'fatih/vim-go'
" Node.js
Plug 'moll/vim-node'
" JSON
Plug 'leshill/vim-json'
" JavaScript
Plug 'pangloss/vim-javascript'
" JavaScript Syntaxチェック
Plug 'jelera/vim-javascript-syntax'
" Vuejs
Plug 'posva/vim-vue'
" Typescript
Plug 'leafgarland/typescript-vim'
" CoffeeScript
Plug 'kchmck/vim-coffee-script'
" CSS3
Plug 'hail2u/vim-css3-syntax'
" Angular.js
Plug 'burnettk/vim-angular'
" Scala
Plug 'derekwyatt/vim-scala'
" Swift
Plug 'keith/swift.vim'
" CSV
Plug 'chrisbra/csv.vim'
" GitHub
Plug 'junegunn/vim-github-dashboard'
Plug 'mattn/gist-vim'
" R言語
Plug 'vim-scripts/Vim-R-plugin'
" ソースコードを実行
Plug 'thinca/vim-quickrun'
" ステータスライン・タブライン
Plug 'itchyny/lightline.vim'
" git操作
Plug 'tpope/vim-fugitive'
" インデントに色をつける
Plug 'nathanaelkane/vim-indent-guides'
" 末尾の空白対策
Plug 'bronson/vim-trailing-whitespace'

call plug#end()
