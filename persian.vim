function! TogglePersian()
    if &keymap == 'mypersian'
        set keymap=
        set norightleft
    else
        set keymap=mypersian
        set rightleft
    endif
endfunction

command! TogglePersian call TogglePersian()
