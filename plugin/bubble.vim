" Bubbling stolen from Tim Pope's vim-unimpaired plugin.
" See https://github.com/tpope/vim-unimpaired/
"
function! s:Move(cmd, count, map) abort
  normal! m`
  exe 'move'.a:cmd.a:count
  norm! ``
  silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction
" Bubble single lines (to Next/Previous line)
nnoremap <silent> <C-p> :<C-U>call <SID>Move('--',v:count1,'Up')<CR>==
nnoremap <silent> <C-n> :<C-U>call <SID>Move('+',v:count1,'Down')<CR>==
" Bubble multiple lines in visual mode
xnoremap <silent> <C-p> :<C-U>exe 'normal! m`'<Bar>exe '''<,''>move--'.v:count1<CR>`[V`]=gv
xnoremap <silent> <C-n> :<C-U>exe 'normal! m`'<Bar>exe '''<,''>move''>+'.v:count1<CR>`[V`]=gv
