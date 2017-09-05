
" change leader key to , (from \)
let mapleader=","

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4

set showmatch	" highlight matching [{()}]
set incsearch	" search as characters are entered
set hlsearch	" highlight matches
nnoremap <silent> <CR> :noh<CR><CR> " unhighlight current match after pressing 'enter'

set cursorline	" highlight current line
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi Search cterm=NONE ctermbg=73 ctermfg=white

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
Plug 'vim-airline/vim-airline' "https://github.com/vim-airline/vim-airline
call plug#end()

set laststatus=2
" if we're using airline, we don't need to display the current mode anymore
set noshowmode
