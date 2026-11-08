" Aeternum Machina — vim-airline theme
" Adapted from the aeternum-machina COSMIC / Neovim colorscheme.
" Palette structure follows the Scriptorium vim-airline theme.
" License: MIT

" Aeternum Machina GUI colors
let s:gui_void       = "#090B0D"
let s:gui_base       = "#111417"
let s:gui_dark       = "#101316"
let s:gui_float      = "#1C2023"
let s:gui_raised     = "#292E32"
let s:gui_select     = "#3B4144"
let s:gui_faint      = "#595F60"
let s:gui_comment    = "#797E7B"
let s:gui_dim        = "#A39F94"
let s:gui_aged       = "#C2B9A8"
let s:gui_text       = "#E7DEC9"
let s:gui_bright     = "#F8F2E5"
let s:gui_ext        = "#827052"
let s:gui_gold       = "#D4AD58"
let s:gui_gold_hi    = "#E7C77B"
let s:gui_green      = "#84AD8D"
let s:gui_green_hi   = "#8FC7A3"
let s:gui_purple     = "#AE9FBB"
let s:gui_purple_hi  = "#C7B7D2"
let s:gui_red        = "#B56C6C"
let s:gui_red_hi     = "#E19491"
let s:gui_blue       = "#76A7B5"
let s:gui_blue_hi    = "#9BC4CF"
let s:gui_orange     = "#C38B4B"

" Nearest xterm-256-color equivalents
let s:cterm_void       = "232"
let s:cterm_base       = "233"
let s:cterm_dark       = "233"
let s:cterm_float      = "234"
let s:cterm_raised     = "235"
let s:cterm_select     = "237"
let s:cterm_faint      = "59"
let s:cterm_comment    = "243"
let s:cterm_dim        = "145"
let s:cterm_aged       = "187"
let s:cterm_text       = "188"
let s:cterm_bright     = "230"
let s:cterm_ext        = "101"
let s:cterm_gold       = "179"
let s:cterm_gold_hi    = "222"
let s:cterm_green      = "108"
let s:cterm_green_hi   = "115"
let s:cterm_purple     = "139"
let s:cterm_purple_hi  = "182"
let s:cterm_red        = "131"
let s:cterm_red_hi     = "174"
let s:cterm_blue       = "109"
let s:cterm_blue_hi    = "116"
let s:cterm_orange     = "137"

let g:airline#themes#aeternum_machina#palette = {}

let s:modified = {
      \ 'airline_c': [
      \   s:gui_gold_hi,
      \   s:gui_float,
      \   s:cterm_gold_hi,
      \   s:cterm_float,
      \   ''
      \ ]
      \ }

" Normal mode — gold accent
let s:N1 = [s:gui_void, s:gui_gold, s:cterm_void, s:cterm_gold]
let s:N2 = [s:gui_text, s:gui_select, s:cterm_text, s:cterm_select]
let s:N3 = [s:gui_aged, s:gui_float, s:cterm_aged, s:cterm_float]

let g:airline#themes#aeternum_machina#palette.normal =
      \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#aeternum_machina#palette.normal_modified = s:modified

" Insert mode — green
let s:I1 = [s:gui_void, s:gui_green, s:cterm_void, s:cterm_green]
let s:I2 = s:N2
let s:I3 = s:N3

let g:airline#themes#aeternum_machina#palette.insert =
      \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#aeternum_machina#palette.insert_modified = s:modified

" Visual mode — purple
let s:V1 = [s:gui_void, s:gui_purple, s:cterm_void, s:cterm_purple]
let s:V2 = s:N2
let s:V3 = s:N3

let g:airline#themes#aeternum_machina#palette.visual =
      \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#aeternum_machina#palette.visual_modified = s:modified

" Replace mode — red
let s:R1 = [s:gui_void, s:gui_red_hi, s:cterm_void, s:cterm_red_hi]
let s:R2 = s:N2
let s:R3 = s:N3

let g:airline#themes#aeternum_machina#palette.replace =
      \ airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#aeternum_machina#palette.replace_modified = s:modified

" Command-line mode — bright gold
let s:CL1 = [s:gui_void, s:gui_gold_hi, s:cterm_void, s:cterm_gold_hi]

let g:airline#themes#aeternum_machina#palette.commandline =
      \ airline#themes#generate_color_map(s:CL1, s:N2, s:N3)

" Inactive mode — subdued
let s:IN1 = [s:gui_comment, s:gui_raised, s:cterm_comment, s:cterm_raised]
let s:IN2 = [s:gui_dim,     s:gui_float,  s:cterm_dim,     s:cterm_float]
let s:IN3 = [s:gui_faint,   s:gui_dark,   s:cterm_faint,   s:cterm_dark]

let g:airline#themes#aeternum_machina#palette.inactive =
      \ airline#themes#generate_color_map(s:IN1, s:IN2, s:IN3)
let g:airline#themes#aeternum_machina#palette.inactive_modified = s:modified

" Terminal mode follows insert mode.
let g:airline#themes#aeternum_machina#palette.terminal =
      \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Warning and error accents for airline extensions.
for s:mode in ['normal', 'insert', 'visual', 'replace', 'commandline', 'terminal']
  let g:airline#themes#aeternum_machina#palette[s:mode].airline_warning =
        \ [s:gui_void, s:gui_gold, s:cterm_void, s:cterm_gold]

  let g:airline#themes#aeternum_machina#palette[s:mode].airline_error =
        \ [s:gui_bright, s:gui_red, s:cterm_bright, s:cterm_red]
endfor

" CtrlP integration
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [s:gui_text, s:gui_select, s:cterm_text, s:cterm_select]
let s:CP2 = [s:gui_void, s:gui_gold,   s:cterm_void, s:cterm_gold]
let s:CP3 = [s:gui_void, s:gui_blue,   s:cterm_void, s:cterm_blue]

let g:airline#themes#aeternum_machina#palette.ctrlp =
      \ airline#extensions#ctrlp#generate_color_map(
      \ s:CP1,
      \ s:CP2,
      \ s:CP3)

" vim: set sw=2 sts=2 et:
