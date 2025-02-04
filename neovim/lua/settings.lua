-- File encoding
vim.opt.fileencoding = "utf-8"

-- line number
vim.opt.number = true

-- Tab and indentation rules
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Scrolling and navigation
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.switchbuf = "useopen"
vim.opt.startofline = false

-- Search behavior
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI enhancements
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
  eol = "↲",
}
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest" }
vim.opt.laststatus = 2
vim.opt.title = true
vim.opt.titlestring = "%F%m%r%h%w"

-- Bracket matching
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.matchpairs:append("<:>")

-- Line wrapping
vim.opt.wrap = true

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- IME settings
vim.opt.iminsert = 0
vim.opt.imsearch = 0

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
