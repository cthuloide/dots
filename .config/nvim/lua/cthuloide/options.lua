-- 1. Line Numbers --

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 4

-- 2. Indentation

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- 3. Search

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- 4. Wrapping and Reading Text

vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.breakindent = true

-- 5. Cursor Context and Movement

vim.wo.scrolloff = 16
vim.wo.sidescrolloff = 16
vim.wo.cursorline = true

-- 6. Split Behavior

vim.o.splitbelow = true
vim.o.splitright = true

-- 7. Signs, Whitespace, and Visual Helpers

vim.wo.signcolumn = "yes"
vim.wo.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

-- 8. Clipboard and Mouse

vim.opt.clipboard = "unnamedplus"
vim.o.mouse = "a"

-- 9. Undo, Files, and Update Behavior

vim.bo.undofile = true
vim.o.updatetime = 250

-- 10. Color and Terminal UI

vim.o.termguicolors = true

-- 11. Completion and Command-Line Comfort

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.showcmd = true
vim.o.showmode = fasle
