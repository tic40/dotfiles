call plug#begin('~/.config/nvim/bundle')

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

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