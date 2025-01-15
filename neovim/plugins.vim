" Directory for plugins
call plug#begin('~/.config/nvim/bundle')

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
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Indent blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" Ruby support
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'tpope/vim-rails'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()

lua << EOF
  require('lualine').setup()
  require('ibl').setup()
  require('nvim-tree').setup()
  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    }),
  })
EOF
