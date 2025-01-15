-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" }, },
})

-- File encoding
vim.o.fileencoding = "utf-8"

-- Tab and indentation rules
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- Scrolling and navigation
vim.o.scrolloff = 3
vim.o.backspace = "indent,eol,start"
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.switchbuf = "useopen"
vim.o.startofline = false

-- Search behavior
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI enhancements
vim.o.ruler = true
vim.o.showcmd = true
vim.o.listchars = "tab:»·,trail:·,extends:❯,precedes:❮,nbsp:␣,eol:↲"
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"
vim.o.laststatus = 2
vim.o.title = true
vim.o.titlestring = "%F%m%r%h%w"

-- Bracket matching
vim.o.showmatch = true
vim.o.matchtime = 1
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

-- Line wrapping
vim.o.wrap = true

-- Disable swap and backup files
vim.o.swapfile = false
vim.o.backup = false

-- IME settings
vim.o.iminsert = 0
vim.o.imsearch = 0

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Remember last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 0 and line("'\"") <= line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})
