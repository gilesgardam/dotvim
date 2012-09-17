" Make with pdflatex if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=pdflatex\ %
endif
" I like to use underscore and colon for reference names
setlocal iskeyword+=_
setlocal iskeyword+=:
" Change $ eqn $ to \[ eqn \]
nnoremap <buffer> <leader>[ f$s\[<CR><Tab><Esc>f$s<CR><Bs>\]<Esc>
" Duplicate the current line and change \begin to \end (LaTeX hack)
nnoremap <buffer> <leader>e yyp^cfn\end<Esc>
