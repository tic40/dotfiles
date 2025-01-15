" Directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'Mofiqul/vscode.nvim'

" Lualine (modern status line)
Plug 'nvim-lualine/lualine.nvim'

" Nvim-tree (file explorer)
Plug 'nvim-tree/nvim-tree.lua'

" Telescope (fuzzy finder)
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " Required dependency for Telescope

" Input completion (modern completion plugin)
Plug 'hrsh7th/nvim-cmp'

" Indent blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" Ruby support
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

lua << EOF
require("ibl").setup()
EOF
