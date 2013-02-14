" Fix omnifunc
if g:pymode && g:pymode_rope && g:pymode_rope_vim_completion
    setlocal omnifunc=RopeOmni
endif

" Motion {{{

    if !pymode#Default('g:pymode_motion', 1) || g:pymode_motion

        nnoremap <buffer> ]]  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', '')<CR>
        nnoremap <buffer> [[  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', 'b')<CR>
        nnoremap <buffer> ]o  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', '')<CR>
        nnoremap <buffer> [o  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', 'b')<CR>
        nnoremap <buffer> ]m  :<C-U>call pymode#motion#move('^\s*\(c\\|cp\)\?def\s', '')<CR>
        nnoremap <buffer> [m  :<C-U>call pymode#motion#move('^\s*\(c\\|cp\)\?def\s', 'b')<CR>

        onoremap <buffer> ]]  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', '')<CR>
        onoremap <buffer> [[  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', 'b')<CR>
        onoremap <buffer> ]o  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', '')<CR>
        onoremap <buffer> [o  :<C-U>call pymode#motion#move('^\(class\\|\(c\\|cp\)\?def\)\s', 'b')<CR>
        onoremap <buffer> ]m  :<C-U>call pymode#motion#move('^\s*\(c\\|cp\)\?def\s', '')<CR>
        onoremap <buffer> [m  :<C-U>call pymode#motion#move('^\s*\(c\\|cp\)\?def\s', 'b')<CR>

        vnoremap <buffer> ]]  :call pymode#motion#vmove('^\(class\\|\(c\\|cp\)\?def\)\s', '')<CR>
        vnoremap <buffer> [[  :call pymode#motion#vmove('^\(class\\|\(c\\|cp\)\?def\)\s', 'b')<CR>
        vnoremap <buffer> ]m  :call pymode#motion#vmove('^\s*\(c\\|cp\)\?def\s', '')<CR>
        vnoremap <buffer> [m  :call pymode#motion#vmove('^\s*\(c\\|cp\)\?def\s', 'b')<CR>

        onoremap <buffer> o  :<C-U>call pymode#motion#select('^\s*\(cdef\)\?\s*class\s', 0)<CR>
        onoremap <buffer> ao :<C-U>call pymode#motion#select('^\s*\(cdef\)\?\s*class\s', 0)<CR>
        onoremap <buffer> io :<C-U>call pymode#motion#select('^\s*\(cdef\)\?\s*class\s', 1)<CR>
        vnoremap <buffer> ao :<C-U>call pymode#motion#select('^\s*\(cdef\)\?\s*class\s', 0)<CR>
        vnoremap <buffer> io :<C-U>call pymode#motion#select('^\s*\(cdef\)\?\s*class\s', 1)<CR>

        onoremap <buffer> m  :<C-U>call pymode#motion#select('^\s*\(c\\|cp\)\?def\s', 0)<CR>
        onoremap <buffer> am :<C-U>call pymode#motion#select('^\s*\(c\\|cp\)\?def\s', 0)<CR>
        onoremap <buffer> im :<C-U>call pymode#motion#select('^\s*\(c\\|cp\)\?def\s', 1)<CR>
        vnoremap <buffer> am :<C-U>call pymode#motion#select('^\s*\(c\\|cp\)\?def\s', 0)<CR>
        vnoremap <buffer> im :<C-U>call pymode#motion#select('^\s*\(c\\|cp\)\?def\s', 1)<CR>

    endif

" }}}
