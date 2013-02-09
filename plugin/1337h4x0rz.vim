" Crazy hacks for the purposes of programming comps like ACM


" COMMENTING
" ----------
" Toggle // comments on current or visually selected lines
" It maps <C-/> in a weird platform dependent way, but hey, it works for me!
" I commented those lines out with vim-commentary (irony).
" vnoremap <C-_> :normal I//<CR>gv:s:\(^\s*\)////:\1:e<CR>:<DEL>
" nnoremap <C-_> I//<ESC>:s:\(^\s*\)////:\1:e<CR>:<DEL>


" DEBUGGING
" ---------
" Add a debug command for the function signature on this line, e.g.
"     int myFunction(int[][] dp, HashMap<Long,Integer> values, String word) {
" gets
"         d("myFunction", dp, values, word);
" inserted below.
nnoremap <leader>d yyp:s/[^ \t()]*[^ \t(),] //g<CR>Id("<Esc>f(s", <Esc>f)C);<Esc>>>:nohls<CR>
"
" Expand `var` into `d("var", var);`
inoremap <C-d> <C-g>u<Esc>^y$id("<Esc>$a", <C-o>p);


" FOR-LOOPING
" -----------
" Expand `i n` into a `for (int i = 0; i < n; ++i) { }` loop...
inoremap <C-f><C-k> <C-g>u<Esc>:s/\v(\S+)\s+(\S+)/for (int \1 = 0; \1 < \2; ++\1)/<CR>:nohls<CR>A {<CR>}<Esc>O
" ... and looping in the other direction, `for (int i = n-1; i >= 0; --i) { }`
inoremap <C-f><C-j> <C-g>u<Esc>:s/\v(\S+)\s+(\S+)/for (int \1 = \2-1; \1 >= 0; --\1)/<CR>:nohls<CR>A {<CR>}<Esc>O
