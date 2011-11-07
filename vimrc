" Use pathogen for managing of the plugins
call pathogen#infect()
call pathogen#helptags()

syntax enable                   " enable syntax-highlighting
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" activate filetype-plugins
filetype plugin on
" activate automatic indentation
filetype indent on
set autoindent

" allow virtual walking in blockmode
set virtualedit=block
" use spaces instead of tabs
set expandtab
set shiftwidth=4 tabstop=4 softtabstop=4
" begin search while typing
set incsearch
" mark all matched words
set hlsearch
" show wildmenu
set wildmenu
" show started commands in the lower right corner
set showcmd
" allow movements after the line ending
set whichwrap=b,s,h,l
" use the clipboard
"set clipboard=unnamed
" only use my own snippets
let g:snippets_dir = '~/.vim/snippets/'
let g:snips_author = 'Benjamin Kober'
"imap <C-X><C-S> <C-R>=ShowAvailableSnips()<CR>
" put outline-window on the right side
let g:Tlist_Use_Right_Window = 1
" use tmux instead of screen
let g:ScreenImpl = 'Tmux'
" command for writing a file with sudo-rights
command! W w !sudo tee % >/dev/null

" improve auto completion
set tags+=~/.vim/tags/sysctags

" adaption for python PEP 8
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python set omnifunc=pythoncomplete#Complete

" detect csv-files
au! BufRead,BufNewFile *.csv setfiletype csv

" configuring supertab
"set completeopt=menu,preview,longest 

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" configuring mouse usage
set ttymouse=xterm
set mouse=a

" source persian functions
source $HOME/.vim/persian.vim
