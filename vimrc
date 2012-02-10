"===============================================================================
"
" Vim Configuration File
"===============================================================================
" Use pathogen for Plugin Management {{{

call pathogen#infect()
call pathogen#helptags()

" }}}
"===============================================================================
" Options {{{

" Use Vim defaults instead of 100% vi compatibility
set nocompatible
" enable syntax-highlighting
syntax enable
" more powerful backspacing
set backspace=indent,eol,start
" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
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
" improve auto completion
set tags+=~/.vim/tags/sysctags
" configuring mouse usage
set ttymouse=xterm
set mouse=a
" set encoding to utf-8
" this is needed on windows
set encoding=utf-8

" }}}
"===============================================================================
" Plugin Configuration {{{

" only use my own snippets
let g:snippets_dir = '~/.vim/snippets/'
let g:snips_author = 'Benjamin Kober'
" put outline-window on the right side
let g:Tlist_Use_Right_Window = 1
" use tmux instead of screen
let g:ScreenImpl = 'Tmux'
" store the yankring in /tmp/
let g:yankring_history_dir = '/tmp/'
" enable vim-acp for snippets
"let g:acp_behaviorSnipmateLength = 1
" preview completion
let g:acp_completeoptPreview = 1
" make completion case sensitive
let g:acp_ignorecaseOption = 0

" }}}
"===============================================================================
" User defined Commands {{{

" command for writing a file with sudo rights
command! W w !sudo tee % >/dev/null

" }}}
"===============================================================================
" Autocommands {{{

" adaption for python PEP 8
au! FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
au! FileType python set omnifunc=pythoncomplete#Complete
" detect csv files
au! BufRead,BufNewFile *.csv setfiletype csv

" }}}
"===============================================================================
" Miscellaneous {{{

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Persian functions
source $HOME/.vim/persian.vim

" }}}
"===============================================================================
" vim: fdm=marker:
