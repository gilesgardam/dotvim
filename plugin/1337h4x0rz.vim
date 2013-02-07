" Crazy hacks for the purposes of programming comps like ACM
"
" Toggle // comments on current or visually selected lines
" It maps <C-/> in a weird platform dependent way, but hey, it works for me!
" I commented those lines out with vim-commentary (irony).
" vnoremap <C-_> :normal I//<CR>gv:s:\(^\s*\)////:\1:e<CR>:<DEL>
" nnoremap <C-_> I//<ESC>:s:\(^\s*\)////:\1:e<CR>:<DEL>
