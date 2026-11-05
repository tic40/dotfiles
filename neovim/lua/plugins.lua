return {
  -- Theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if not vim.g.vscode then
        vim.o.termguicolors = true
        vim.cmd("colorscheme vscode")
      end
    end,
  },

  -- Syntax highlight
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      local want = {
        "vim", "dockerfile", "typescript", "tsx", "javascript", "json",
        "lua", "bash", "markdown", "css", "scss", "yaml", "vue", "php",
        "html", "cpp", "ruby", "python",
      }
      local installed = require('nvim-treesitter.config').get_installed('parsers') or {}
      local installed_set = {}
      for _, p in ipairs(installed) do installed_set[p] = true end
      local missing = vim.tbl_filter(function(p) return not installed_set[p] end, want)
      if #missing > 0 then
        require('nvim-treesitter').install(missing)
      end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if lang and pcall(vim.treesitter.start, args.buf, lang) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      local global_ts = vim.fn.glob(vim.env.HOME .. "/Library/pnpm/global/*/*/node_modules/typescript/lib", false, true)[1]
      vim.lsp.config("ts_ls", {
        init_options = { tsserver = { fallbackPath = global_ts } },
      })
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--query-driver=/usr/local/bin/g++*,/opt/homebrew/bin/g++*" },
      })
      vim.lsp.enable({ "ruby_lsp", "ts_ls", "clangd" })
    end,
  },

  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}