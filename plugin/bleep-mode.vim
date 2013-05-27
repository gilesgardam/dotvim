" A fun plugin that will censor your expletives for you!
" To toggle BLEEP mode, just press Control-B in INSERT mode
inoremap <silent> <C-b> <Esc>:call BleepToggle()<CR>i<RIGHT>
let b:hasbleep=0
function! BleepToggle()
    if b:hasbleep==1
        augroup bleepmode
            autocmd!
        augroup END
    else
        echohl ModeMsg | echo "-- BLEEPING --" | echohl None
        augroup bleepmode
            autocmd InsertCharPre * let v:char=s:bleepOut(v:char)
        augroup END
    endif
    let b:hasbleep=1-b:hasbleep
endfunction
let s:subs = {
    \ ' ': ' ',
    \ '1': '!',
    \ '!': '!',
    \ 'q': '!',
    \ 'a': '!',
    \ 'z': '!',
    \ '2': '@',
    \ '@': '@',
    \ 'w': '@',
    \ 's': '@',
    \ 'x': '@',
    \ '3': '#',
    \ '#': '#',
    \ 'e': '#',
    \ 'd': '#',
    \ 'c': '#',
    \ '4': '$',
    \ '$': '$',
    \ 'r': '$',
    \ 'f': '$',
    \ 'v': '$',
    \ '5': '%',
    \ '%': '%',
    \ 't': '%',
    \ 'g': '%',
    \ 'b': '%',
    \ '6': '^',
    \ '^': '^',
    \ 'y': '^',
    \ 'h': '^',
    \ 'n': '^',
    \ '7': '&',
    \ '&': '&',
    \ 'u': '&',
    \ 'j': '&',
    \ 'm': '&',
    \ '8': '*',
    \ '*': '*',
    \ 'i': '*',
    \ 'k': '*',
    \ '9': '(',
    \ '(': '(',
    \ 'o': '(',
    \ 'l': '(',
    \ '0': ')',
    \ ')': ')',
    \ 'p': ')',
\}
function! s:bleepOut(char)
    let v:char = tolower(a:char)
    if has_key(s:subs, v:char)
        return s:subs[v:char]
    endif
    return '*'
endfunction
