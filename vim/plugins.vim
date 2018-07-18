call plug#begin('~/.vim/bundle')

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" indent color
Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=1
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=14
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=3
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1

" HTML highlight
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
Plug 'elzr/vim-json'
" JavaScript
Plug 'pangloss/vim-javascript'
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
" CSV
Plug 'chrisbra/csv.vim'
" GitHub
Plug 'tpope/vim-fugitive'
" Emmet
Plug 'mattn/emmet-vim'
" input completion
Plug 'shougo/neocomplete.vim'
" run soucecode
Plug 'thinca/vim-quickrun'
" status line
Plug 'itchyny/lightline.vim'
" delete empty whitespace
Plug 'bronson/vim-trailing-whitespace'
" NERDTree
Plug 'scrooloose/nerdtree'
  map <C-o> :NERDTreeToggle<CR>
" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
  map ; :Files<CR>

call plug#end()
