call plug#begin('~/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
call plug#end()

" Main Configurations

set encoding=UTF-8
set cursorline colorcolumn=80
set number relativenumber
set nowrap 

" Filetype-Specific Configuration

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Color Configuration

colorscheme carbon

" Emmet Configuration

let g:user_emmet_leader_key=','
