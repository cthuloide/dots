" Name:   aeternum-machina
" Desc:   Neovim colorscheme matching the COSMIC "aeternum-machina" dark theme
" Option: let g:aeternum_machina_transparent = 1   (before :colorscheme)

hi clear
if exists('syntax_on')
  syntax reset
endif
set termguicolors
set background=dark
let g:colors_name = 'aeternum-machina'

" ---------------------------------------------------------------- palette
let s:c = {
  \ 'bg':        '#111417', 'bg_dark':   '#101316', 'bg_darker': '#090B0D',
  \ 'bg_float':  '#1C2023', 'bg_raised': '#292E32', 'bg_select': '#3B4144',
  \ 'bg_cursor': '#181C1F',
  \ 'line_nr':   '#595F60', 'comment':   '#797E7B', 'fg_dim':    '#A39F94',
  \ 'fg_mid':    '#C2B9A8', 'fg':        '#E7DEC9', 'fg_bright': '#F8F2E5',
  \ 'warm_grey': '#B3A38C', 'ext_grey':  '#827052',
  \ 'blue':      '#76A7B5', 'indigo':    '#97A9C0', 'purple':    '#AE9FBB',
  \ 'pink':      '#B9828B', 'red':       '#B56C6C', 'orange':    '#C38B4B',
  \ 'yellow':    '#D4AD58', 'green':     '#84AD8D',
  \ 'br_red':    '#E19491', 'br_green':  '#8FC7A3', 'br_orange': '#DB9D63',
  \ 'br_yellow': '#E7C77B', 'br_blue':   '#9BC4CF', 'br_purple': '#C7B7D2',
  \ 'dim_red':   '#864D50', 'dim_yellow': '#9C7D3D',
  \ 'diff_add':  '#1B2923', 'diff_change': '#1D2830',
  \ 'diff_del':  '#2B1F22', 'diff_text': '#2A3B38', 'warn_bg': '#27231A',
  \ }

let s:none = 'NONE'
let s:bg = get(g:, 'aeternum_machina_transparent', 0) ? s:none : s:c.bg
let s:float = get(g:, 'aeternum_machina_transparent', 0) ? s:none : s:c.bg_float

" ---------------------------------------------------------------- helper
" s:h(group, fg, bg [, attrs [, sp]])
function! s:h(group, fg, bg, ...) abort
  let l:attr = a:0 > 0 ? a:1 : 'NONE'
  let l:sp   = a:0 > 1 ? a:2 : 'NONE'
  execute 'hi ' . a:group
    \ . ' guifg=' . a:fg . ' guibg=' . a:bg
    \ . ' guisp=' . l:sp . ' gui=' . l:attr . ' cterm=' . l:attr
endfunction

let s:c0 = s:c  " short alias for readability below
let c = s:c

" ---------------------------------------------------------------- editor UI
call s:h('Normal',       c.fg,       s:bg)
call s:h('NormalNC',     c.fg,       s:bg)
call s:h('NormalFloat',  c.fg,       s:float)
call s:h('FloatBorder',  c.ext_grey, s:float)
call s:h('FloatTitle',   c.yellow,   s:float, 'bold')
call s:h('Cursor',       c.bg,       c.yellow)
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link TermCursor Cursor
call s:h('CursorLine',   s:none,     c.bg_cursor)
call s:h('CursorColumn', s:none,     c.bg_cursor)
call s:h('ColorColumn',  s:none,     c.bg_cursor)
call s:h('CursorLineNr', c.yellow,   s:none, 'bold')
call s:h('LineNr',       c.line_nr,  s:none)
call s:h('SignColumn',   c.line_nr,  s:bg)
call s:h('FoldColumn',   c.line_nr,  s:bg)
call s:h('Folded',       c.fg_dim,   c.bg_raised)
call s:h('EndOfBuffer',  c.bg,       s:none)
call s:h('NonText',      c.bg_select, s:none)
call s:h('Whitespace',   c.bg_raised, s:none)
call s:h('SpecialKey',   c.bg_select, s:none)
call s:h('Conceal',      c.comment,  s:none)
call s:h('VertSplit',    c.bg_raised, s:none)
call s:h('WinSeparator', c.bg_raised, s:none)
call s:h('MatchParen',   c.br_yellow, c.bg_select, 'bold')
call s:h('Visual',       s:none,     c.bg_select)
call s:h('VisualNOS',    s:none,     c.bg_select)
call s:h('Search',       c.bg,       c.dim_yellow)
call s:h('IncSearch',    c.bg,       c.yellow)
call s:h('CurSearch',    c.bg,       c.yellow, 'bold')
call s:h('Substitute',   c.bg,       c.red)
call s:h('QuickFixLine', s:none,     c.bg_raised)
call s:h('Directory',    c.blue,     s:none)
call s:h('Title',        c.yellow,   s:none, 'bold')
call s:h('Question',     c.green,    s:none)
call s:h('MoreMsg',      c.green,    s:none)
call s:h('ModeMsg',      c.fg_mid,   s:none, 'bold')
call s:h('ErrorMsg',     c.br_red,   s:none)
call s:h('WarningMsg',   c.yellow,   s:none)
call s:h('WildMenu',     c.bg,       c.yellow)
call s:h('Pmenu',        c.fg,       c.bg_float)
call s:h('PmenuSel',     c.fg_bright, c.bg_select)
call s:h('PmenuSbar',    s:none,     c.bg_raised)
call s:h('PmenuThumb',   s:none,     c.ext_grey)
call s:h('StatusLine',   c.fg_mid,   c.bg_float)
call s:h('StatusLineNC', c.comment,  c.bg_dark)
call s:h('TabLine',      c.comment,  c.bg_dark)
call s:h('TabLineFill',  s:none,     c.bg_darker)
call s:h('TabLineSel',   c.yellow,   c.bg, 'bold')
call s:h('WinBar',       c.fg_mid,   s:bg)
call s:h('WinBarNC',     c.comment,  s:bg)
call s:h('SpellBad',     s:none, s:none, 'undercurl', c.red)
call s:h('SpellCap',     s:none, s:none, 'undercurl', c.yellow)
call s:h('SpellLocal',   s:none, s:none, 'undercurl', c.blue)
call s:h('SpellRare',    s:none, s:none, 'undercurl', c.purple)

" ---------------------------------------------------------------- diff
call s:h('DiffAdd',      s:none,     c.diff_add)
call s:h('DiffChange',   s:none,     c.diff_change)
call s:h('DiffDelete',   c.dim_red,  c.diff_del)
call s:h('DiffText',     s:none,     c.diff_text)
call s:h('Added',        c.green,    s:none)
call s:h('Changed',      c.blue,     s:none)
call s:h('Removed',      c.red,      s:none)

" ---------------------------------------------------------------- syntax
call s:h('Comment',      c.comment,  s:none, 'italic')
call s:h('Constant',     c.orange,   s:none)
call s:h('String',       c.green,    s:none)
call s:h('Character',    c.green,    s:none)
call s:h('Number',       c.orange,   s:none)
call s:h('Boolean',      c.br_orange, s:none)
call s:h('Float',        c.orange,   s:none)
call s:h('Identifier',   c.fg,       s:none)
call s:h('Function',     c.blue,     s:none)
call s:h('Statement',    c.purple,   s:none)
call s:h('Conditional',  c.purple,   s:none)
call s:h('Repeat',       c.purple,   s:none)
call s:h('Label',        c.purple,   s:none)
call s:h('Operator',     c.warm_grey, s:none)
call s:h('Keyword',      c.purple,   s:none)
call s:h('Exception',    c.pink,     s:none)
call s:h('PreProc',      c.pink,     s:none)
call s:h('Include',      c.pink,     s:none)
call s:h('Define',       c.pink,     s:none)
call s:h('Macro',        c.pink,     s:none)
call s:h('PreCondit',    c.pink,     s:none)
call s:h('Type',         c.yellow,   s:none)
call s:h('StorageClass', c.yellow,   s:none)
call s:h('Structure',    c.yellow,   s:none)
call s:h('Typedef',      c.yellow,   s:none)
call s:h('Special',      c.br_orange, s:none)
call s:h('SpecialChar',  c.br_orange, s:none)
call s:h('Tag',          c.blue,     s:none)
call s:h('Delimiter',    c.fg_dim,   s:none)
call s:h('SpecialComment', c.ext_grey, s:none, 'italic')
call s:h('Debug',        c.red,      s:none)
call s:h('Underlined',   c.blue,     s:none, 'underline')
call s:h('Ignore',       c.comment,  s:none)
call s:h('Error',        c.br_red,   s:none)
call s:h('Todo',         c.bg,       c.yellow, 'bold')

" ---------------------------------------------------------------- diagnostics
call s:h('DiagnosticError', c.red,    s:none)
call s:h('DiagnosticWarn',  c.yellow, s:none)
call s:h('DiagnosticInfo',  c.blue,   s:none)
call s:h('DiagnosticHint',  c.green,  s:none)
call s:h('DiagnosticOk',    c.green,  s:none)
call s:h('DiagnosticUnderlineError', s:none, s:none, 'undercurl', c.red)
call s:h('DiagnosticUnderlineWarn',  s:none, s:none, 'undercurl', c.yellow)
call s:h('DiagnosticUnderlineInfo',  s:none, s:none, 'undercurl', c.blue)
call s:h('DiagnosticUnderlineHint',  s:none, s:none, 'undercurl', c.green)
call s:h('DiagnosticVirtualTextError', c.red,    c.diff_del)
call s:h('DiagnosticVirtualTextWarn',  c.yellow, c.warn_bg)
call s:h('DiagnosticVirtualTextInfo',  c.blue,   c.diff_change)
call s:h('DiagnosticVirtualTextHint',  c.green,  c.diff_add)

" ---------------------------------------------------------------- treesitter
call s:h('@variable',            c.fg,        s:none)
call s:h('@variable.builtin',    c.pink,      s:none)
call s:h('@variable.parameter',  c.fg_mid,    s:none)
call s:h('@variable.member',     c.indigo,    s:none)
call s:h('@constant',            c.orange,    s:none)
call s:h('@constant.builtin',    c.br_orange, s:none)
call s:h('@constant.macro',      c.pink,      s:none)
call s:h('@module',              c.warm_grey, s:none)
call s:h('@label',               c.purple,    s:none)
call s:h('@string',              c.green,     s:none)
call s:h('@string.escape',       c.br_orange, s:none)
call s:h('@string.regexp',       c.br_orange, s:none)
call s:h('@string.special.url',  c.blue,      s:none, 'underline')
call s:h('@character',           c.green,     s:none)
call s:h('@number',              c.orange,    s:none)
call s:h('@boolean',             c.br_orange, s:none)
call s:h('@type',                c.yellow,    s:none)
call s:h('@type.builtin',        c.br_yellow, s:none)
call s:h('@attribute',           c.pink,      s:none)
call s:h('@property',            c.indigo,    s:none)
call s:h('@function',            c.blue,      s:none)
call s:h('@function.builtin',    c.br_blue,   s:none)
call s:h('@function.macro',      c.pink,      s:none)
call s:h('@constructor',         c.yellow,    s:none)
call s:h('@operator',            c.warm_grey, s:none)
call s:h('@keyword',             c.purple,    s:none)
call s:h('@keyword.function',    c.purple,    s:none)
call s:h('@keyword.return',      c.br_purple, s:none)
call s:h('@keyword.import',      c.pink,      s:none)
call s:h('@punctuation.delimiter', c.fg_dim,  s:none)
call s:h('@punctuation.bracket', c.fg_dim,    s:none)
call s:h('@punctuation.special', c.br_orange, s:none)
hi! link @comment Comment
hi! link @comment.todo Todo
call s:h('@comment.error',       c.bg, c.red,    'bold')
call s:h('@comment.warning',     c.bg, c.yellow, 'bold')
call s:h('@comment.note',        c.bg, c.blue,   'bold')
call s:h('@tag',                 c.blue,      s:none)
call s:h('@tag.attribute',       c.indigo,    s:none)
call s:h('@tag.delimiter',       c.fg_dim,    s:none)
call s:h('@markup.heading',      c.yellow,    s:none, 'bold')
call s:h('@markup.strong',       s:none,      s:none, 'bold')
call s:h('@markup.italic',       s:none,      s:none, 'italic')
call s:h('@markup.strikethrough', s:none,     s:none, 'strikethrough')
call s:h('@markup.link',         c.blue,      s:none)
call s:h('@markup.link.url',     c.blue,      s:none, 'underline')
call s:h('@markup.raw',          c.green,     s:none)
call s:h('@markup.list',         c.yellow,    s:none)
call s:h('@diff.plus',           c.green,     s:none)
call s:h('@diff.minus',          c.red,       s:none)
call s:h('@diff.delta',          c.blue,      s:none)

" LSP semantic tokens
hi! link @lsp.type.namespace  @module
hi! link @lsp.type.parameter  @variable.parameter
hi! link @lsp.type.property   @property
hi! link @lsp.type.enumMember @constant
hi! link @lsp.type.macro      @function.macro
hi! link @lsp.typemod.variable.readonly @constant
call s:h('LspReferenceText',  s:none, c.bg_raised)
call s:h('LspReferenceRead',  s:none, c.bg_raised)
call s:h('LspReferenceWrite', s:none, c.bg_raised, 'underline')
call s:h('LspInlayHint',      c.line_nr, c.bg_cursor, 'italic')
call s:h('LspSignatureActiveParameter', c.yellow, s:none, 'bold')

" ---------------------------------------------------------------- common plugins (harmless if unused)
call s:h('GitSignsAdd',    c.green, s:none)
call s:h('GitSignsChange', c.blue,  s:none)
call s:h('GitSignsDelete', c.red,   s:none)
call s:h('GitGutterAdd',    c.green, s:none)
call s:h('GitGutterChange', c.blue,  s:none)
call s:h('GitGutterDelete', c.red,   s:none)

call s:h('CmpItemAbbr',           c.fg,      s:none)
call s:h('CmpItemAbbrMatch',      c.yellow,  s:none, 'bold')
call s:h('CmpItemAbbrMatchFuzzy', c.yellow,  s:none)
call s:h('CmpItemAbbrDeprecated', c.comment, s:none, 'strikethrough')
call s:h('CmpItemMenu',           c.comment, s:none)

call s:h('TelescopeNormal',       c.fg,       s:float)
call s:h('TelescopeBorder',       c.ext_grey, s:float)
call s:h('TelescopeSelection',    c.fg_bright, c.bg_select)
call s:h('TelescopeMatching',     c.yellow,   s:none, 'bold')
call s:h('TelescopePromptTitle',  c.bg,       c.yellow, 'bold')
call s:h('TelescopePreviewTitle', c.bg,       c.green,  'bold')

call s:h('NvimTreeNormal',     c.fg,    c.bg_dark)
call s:h('NvimTreeRootFolder', c.yellow, s:none, 'bold')
call s:h('NvimTreeFolderName', c.fg_mid, s:none)
call s:h('IblIndent',          c.bg_raised, s:none)
call s:h('IblScope',           c.ext_grey,  s:none)
call s:h('WhichKey',           c.yellow, s:none)
call s:h('WhichKeyDesc',       c.fg,     s:none)
call s:h('WhichKeyGroup',      c.blue,   s:none)

" ---------------------------------------------------------------- terminal colors
let g:terminal_color_0  = '#111417'
let g:terminal_color_1  = '#B56C6C'
let g:terminal_color_2  = '#84AD8D'
let g:terminal_color_3  = '#D4AD58'
let g:terminal_color_4  = '#76A7B5'
let g:terminal_color_5  = '#AE9FBB'
let g:terminal_color_6  = '#76A7B5'
let g:terminal_color_7  = '#E7DEC9'
let g:terminal_color_8  = '#595F60'
let g:terminal_color_9  = '#E19491'
let g:terminal_color_10 = '#8FC7A3'
let g:terminal_color_11 = '#E7C77B'
let g:terminal_color_12 = '#9BC4CF'
let g:terminal_color_13 = '#C7B7D2'
let g:terminal_color_14 = '#9BC4CF'
let g:terminal_color_15 = '#F8F2E5'

unlet s:c0 c
