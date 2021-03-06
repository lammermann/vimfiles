"===============================================================================
"
" Vim Configuration File
"===============================================================================
" Use Vundle for Plugin Management {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'othree/vim-autocomplpop'
Plugin 'eparreno/vim-l9'
Plugin 'chrisbra/NrrwRgn'
"Plugin 'vim-scipts/Align'
Plugin 'junegunn/vim-easy-align'
Plugin 'SirVer/ultisnips'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'majutsushi/tagbar'
Plugin 'jamessan/vim-gnupg'
Plugin 'sjl/gundo.vim'
Plugin 'skwp/greplace.vim'
Plugin 'hari-rangarajan/CCTree'
Plugin 'tmhedberg/matchit'
Plugin 'benekastah/neomake'
Plugin 'Mizuchi/vim-ranger.git'
"Plugin 'vim-scripts/YankRing'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" }}}
"===============================================================================
" Options {{{

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
set shiftwidth=2 tabstop=2 softtabstop=2
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
set complete +=i
" improve auto completion
set tags+=~/.vim/tags/sysctags
if !has('nvim')
  " Use Vim defaults instead of 100% vi compatibility
  set nocompatible
  " configuring mouse usage
  set ttymouse=xterm
  set mouse=a
  " better usage of colors
  set t_Co=256
endif
" better colorscheme for diffs
"colorscheme softblue
" set encoding to utf-8
" this is needed on windows
set encoding=utf-8
" set statusline with git informations
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

if has('nvim')
  "use ESC to leave terminal mode
  tnoremap <C-Esc> <C-\><C-n>
  "navigate in terminal mode
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
endif
" }}}
"===============================================================================
" Plugin Configuration {{{

" only use my own snippets
let g:UltiSnipsSnippetDirectories = [$HOME . "/.vim/UltiSnips"]
let g:UltiSnipsSnippetsDir = $HOME . '/.vim/UltiSnips/'
let g:UltiSnipsEditSplit = 'vertical'
let g:snips_author = 'Benjamin Kober'
" simulate TextMate behavior
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsNoPythonWarning = 1
let g:ycm_key_list_select_completion = ['<ENTER>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_filetype_blacklist = {}
" sort tags in tagbar by order in the source file
let g:tagbar_sort = 0
let g:tagbar_expand = 1
let g:tagbar_width = 30
" use tmux instead of screen
let g:ScreenImpl = 'Tmux'
" don't close tmux buffers on exit
let g:ScreenShellQuitOnVimExit = 0
" store the yankring in /tmp/
let g:yankring_history_dir = '/tmp/'
" make completion case sensitive
let g:acp_ignorecaseOption = 0
" enable vim-acp for snippets
let g:acp_behaviorSnipmateLength = -1
" set environment to english for fugitive
let $LANG = 'en_US.UTF-8'

" }}}
"===============================================================================
" User defined Commands {{{

" command for writing a file with sudo rights
command! W w !sudo tee % >/dev/null
" alias TagbarToggle to the shorter Tbar
command! Tbar TagbarToggle

" }}}
"===============================================================================
" Autocommands {{{


" automatically reload vimrc when it's saved
au! BufWritePost ~/.vim/vimrc so ~/.vim/vimrc
" adaption for python PEP 8
au! FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" completion
au! FileType python set omnifunc=pythoncomplete#Complete
au! FileType xml set omnifunc=xmlcomplete#CompleteTags
" just two spaces for lua
au! FileType lua set shiftwidth=2 tabstop=2 softtabstop=2
" just two spaces for html
au! FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" detect csv files
au! BufRead,BufNewFile *.csv setfiletype csv
" detect qml files
au! BufRead,BufNewFile *.qml setfiletype javascript
" always place the quickfix window on the bottom
au! FileType qf wincmd J
" remove whitespace on saving and use unix format
fun! StripTrailingWhitespace()
  "let l:fts = ["c","cpp","lua","python","markdown","vim"]
  "if index(l:fts, &ft) == -1
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    "set ff=unix
    call setpos('.', l:save_cursor)
  "end
endfun
au! BufWritePre * :call StripTrailingWhitespace()
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
