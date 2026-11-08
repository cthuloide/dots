" =============================================================================
" Neovim: Markdown writing and HTML/CSS editing
" Requires Neovim >= 0.11.3, vim-plug, and Node.js/npm for optional tools.
" =============================================================================

" Plugins (preserve original setup and theme)
call plug#begin('~/.config/nvim/plugins')
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'neovim/nvim-lspconfig'
call plug#end()

" General editing
set encoding=utf-8
set hidden
set number relativenumber
set title mouse=a
set scrolloff=5
set splitbelow splitright
set signcolumn=yes
set undofile
set updatetime=300

" Default indentation: four spaces except where specified below
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smarttab autoindent

" Search and interface
set incsearch hlsearch ignorecase smartcase
set wildmenu
set wildmode=longest:full,full
set ruler laststatus=2 showcmd showmode
set list
set listchars=tab:»-,trail:»
set wrap breakindent
set fillchars+=vert:\ 

" Filetype settings
filetype plugin indent on
syntax enable
let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'python', 'bash=sh']

augroup personal_writing
  autocmd!
  autocmd FileType html,css,xml,markdown,journal setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd FileType markdown,text,journal setlocal spell spelllang=en_us wrap linebreak breakindent
  autocmd FileType markdown,text,journal setlocal textwidth=80 colorcolumn=81
  autocmd FileType markdown,text,journal setlocal formatoptions-=t
  autocmd FileType markdown setlocal formatoptions+=n
  autocmd FileType html,css,xml,python setlocal textwidth=0 colorcolumn=81
  autocmd FileType html,css,xml,python setlocal formatoptions-=t
  autocmd FileType css setlocal nowrap
  autocmd FileType markdown nnoremap <buffer> <silent> <leader>p <Cmd>MarkdownPreviewToggle<CR>
augroup END

" Markdown preview stays off until requested.
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" Keep original custom theme (fall back safely when not installed).
set termguicolors
let g:aeternum_machina_transparent = 1
try
  colorscheme aeternum-machina
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
let g:airline_theme = 'aeternum_machina'

" Retain original Emmet leader (e.g., ,, to expand abbreviation).
let g:user_emmet_leader_key = ','

" Writing shortcuts (default <Leader> is backslash).
nnoremap <silent> <leader>h <Cmd>nohlsearch<CR>
nnoremap <silent> <leader>q gqap
nnoremap <silent> <leader>s <Cmd>setlocal spell!<CR>

" Format current unsaved buffer through local or PATH Prettier; no format-on-save.
command! -bar PrettierFormat lua require('writing_setup').format_prettier()
nnoremap <silent> <leader>f <Cmd>PrettierFormat<CR>

" LSP: built-in Neovim client + nvim-lspconfig server definitions.
" Keep initialization in Lua without converting the whole configuration.
if has('nvim-0.11.3')
  lua require('writing_setup').setup_lsp()
else
  echohl WarningMsg
  echom 'HTML/CSS LSP needs Neovim 0.11.3 or newer.'
  echohl None
endif
