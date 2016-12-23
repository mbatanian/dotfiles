
" change leader key to , (from \)
let mapleader=","

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4

set showmatch	" highlight matching [{()}]
set incsearch	" search as characters are entered
set hlsearch	" highlight matches

set cursorline	" highlight current line
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi Search cterm=NONE ctermbg=grey ctermfg=white

" disable beeping
set vb t_vb=

set number		" show line numbers
syntax on

set encoding=utf-8
set showcmd	" show command in bottom bar
set visualbell

" make search case-insensitive, unless I type case
set ignorecase
set smartcase
" default to global substitution
set gdefault

" very magic searching
nnoremap / /\v
vnoremap / /\v

" autosave when switch focus
au FocusLost * :wa

" call out to python to pretty-print json
com! FormatJSON %!python -m json.tool

" move to beginning / end of line
nnoremap B ^
nnoremap E $
" turn $ and ^ to no-op
nnoremap $ <nop>
nnoremap ^ <nop>

" helpful for nerdcommenter plugin - figures out the appropriate comment type
filetype plugin on

call plug#begin()
Plug 'scrooloose/nerdcommenter' "https://github.com/scrooloose/nerdcommenter
call plug#end()
