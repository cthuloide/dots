-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Prose and wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.conceallevel = 1

-- UI
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = { vert = "│" }

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- System and performance
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wildmode = "longest:full,full"
