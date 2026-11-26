vim.opt.number = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Scrolling and navigation
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.clipboard = "unnamedplus"
vim.opt.switchbuf = "useopen"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.wildmode = { "list", "longest" }
vim.opt.title = true
vim.opt.titlestring = "%F%m%r%h%w"

-- Bracket matching
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.matchpairs:append("<:>")

vim.opt.swapfile = false
vim.opt.undofile = true

-- IME
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
