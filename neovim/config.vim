" Color scheme
set t_u7=
colorscheme zaibatsu

" File encoding
set fileencoding=utf-8

" Tab and indentation rules
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set shiftround

" Scrolling and navigation
set scrolloff=3
set backspace=indent,eol,start
set clipboard=unnamed
set hidden
set switchbuf=useopen
set nostartofline

" Search behavior
set incsearch
set hlsearch
set ignorecase
set smartcase

" UI enhancements
set ruler
set showcmd
set listchars=tab:»·,trail:·,extends:❯,precedes:❮,nbsp:␣,eol:↲
set wildmenu
set wildmode=list:longest
set laststatus=2
set title
set titlestring=%F%m%r%h%w

" Bracket matching
set showmatch
set matchtime=1
set matchpairs+=<:>

" Line wrapping
set wrap

" Disable swap and backup files
set noswapfile
set nobackup

" IME settings
set iminsert=0
set imsearch=0
set imdisable

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Remember last cursor position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
