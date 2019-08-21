
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
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=black
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
Plug 'junegunn/goyo.vim' "https://github.com/junegunn/goyo.vim
Plug 'masukomi/vim-markdown-folding' "https://github.com/masukomi/vim-markdown-folding
call plug#end()

" goyo enter/leave settings
function! s:goyo_enter()
	highlight Normal ctermbg=Gray
	highlight Normal ctermfg=Black
	set cursorline!
	set wrap
	set linebreak
endfunction
function! s:goyo_leave()
	set cursorline " highlight current line
	hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
	hi Search cterm=NONE ctermbg=73 ctermfg=white
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ProseMode, adapted from https://statico.github.io/vim3.html
command! ProseMode call goyo#execute(0, [])
nmap <Leader>p :ProseMode<CR>

set laststatus=2
" if we're using airline, we don't need to display the current mode anymore
set noshowmode
