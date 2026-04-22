-- Name: IBM Carbon Dark
-- Description: A minimal Neovim colorscheme based on IBM Carbon Design System.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "ibm_carbon_dark"

-- Color Palette
local colors = {
  bg      = "#161616", 
  fg      = "#f4f4f4", 
  dim     = "#8d8d8d", 
  red     = "#fa4d56", 
  green   = "#42be65", 
  yellow  = "#f1c21b", 
  blue    = "#4589ff", 
  magenta = "#ee5396", 
  cyan    = "#33b1ff", 
  cursor  = "#78a9ff", 
  bg_hi   = "#393939", 
}

-- Highlight Function
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core Editor Highlights
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg_hi })
hi("ColorColumn", { bg = colors.bg_hi })
hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorLine", { bg = colors.bg_hi })
hi("CursorColumn", { bg = colors.bg_hi })
hi("LineNr", { fg = colors.dim })
hi("CursorLineNr", { fg = colors.fg, bold = true })
hi("VertSplit", { fg = colors.bg_hi, bg = colors.bg })
hi("SignColumn", { bg = colors.bg })
hi("Pmenu", { fg = colors.fg, bg = colors.bg_hi })
hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.cyan })
hi("Visual", { bg = colors.bg_hi })
hi("MatchParen", { fg = colors.yellow, bold = true })

-- Syntax Highlights
hi("Comment", { fg = colors.dim, italic = true })
hi("Constant", { fg = colors.cyan })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.cyan })
hi("Boolean", { fg = colors.cyan })
hi("Float", { fg = colors.cyan })
hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue })
hi("Statement", { fg = colors.magenta })
hi("Conditional", { fg = colors.magenta })
hi("Repeat", { fg = colors.magenta })
hi("Label", { fg = colors.magenta })
hi("Operator", { fg = colors.fg })
hi("Keyword", { fg = colors.magenta })
hi("Exception", { fg = colors.red })
hi("PreProc", { fg = colors.yellow })
hi("Type", { fg = colors.yellow })
hi("Special", { fg = colors.cyan })
hi("Underlined", { underline = true })
hi("Error", { fg = colors.red, bold = true })
hi("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })
