vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

local gh = function(repo) return "https://github.com/" .. repo end

vim.pack.add({
  gh("Mofiqul/vscode.nvim"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("lukas-reineke/indent-blankline.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("nvim-tree/nvim-tree.lua"),
  gh("ibhagwan/fzf-lua"),
  gh("tpope/vim-fugitive"),
  gh("neovim/nvim-lspconfig"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.*") },
}, { confirm = false })

-- Theme
if not vim.g.vscode then
  vim.cmd.colorscheme("vscode")
end

-- Syntax highlight
do
  require("nvim-treesitter").setup()

  local want = {
    "vim", "dockerfile", "typescript", "tsx", "javascript", "json",
    "lua", "bash", "markdown", "css", "scss", "yaml", "vue", "php",
    "html", "cpp", "ruby", "python",
  }
  local installed = require("nvim-treesitter.config").get_installed("parsers") or {}
  local installed_set = {}
  for _, p in ipairs(installed) do installed_set[p] = true end
  local missing = vim.tbl_filter(function(p) return not installed_set[p] end, want)
  if #missing > 0 then
    require("nvim-treesitter").install(missing)
  end

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang and pcall(vim.treesitter.start, args.buf, lang) then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

-- Indent guides
require("ibl").setup()

-- File tree
require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true })

-- Fuzzy finder
do
  local fzf = require("fzf-lua")
  fzf.setup()
  vim.keymap.set("n", "<leader>ff", fzf.files)
  vim.keymap.set("n", "<leader>fg", fzf.live_grep)
  vim.keymap.set("n", "<leader>fb", fzf.buffers)
  vim.keymap.set("n", "<leader>fh", fzf.helptags)
end

-- Completion
require("blink.cmp").setup({
  keymap = { preset = "enter" },
  sources = { default = { "lsp", "path", "buffer" } },
})

-- LSP
do
  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })
  local global_ts = vim.fn.glob(vim.env.HOME .. "/Library/pnpm/global/*/*/node_modules/typescript/lib", false, true)[1]
  vim.lsp.config("ts_ls", {
    init_options = { tsserver = { fallbackPath = global_ts } },
  })
  vim.lsp.config("clangd", {
    cmd = { "clangd", "--query-driver=/usr/local/bin/g++*,/opt/homebrew/bin/g++*" },
  })
  vim.lsp.enable({ "ruby_lsp", "ts_ls", "clangd" })
end
