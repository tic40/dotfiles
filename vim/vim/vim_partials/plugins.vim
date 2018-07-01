call plug#begin('~/.vim/bundle')

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

" Vim非同期処理ライブラリ
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" スニペット
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" 入力補完
Plug 'shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  " enter keyで補完候補確定
  imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
  " tab keyで補完候補選択
  imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

" emmet
Plug 'mattn/emmet-vim'
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
"Plug 'davidhalter/jedi-vim'
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
