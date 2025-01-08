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

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" GitHub
Plug 'tpope/vim-fugitive'
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

