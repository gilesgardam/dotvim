" Insert closing parens
inoremap <buffer> {<CR> {<CR>}<Esc>O
" Make with javac if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=javac\ -Xlint\ %
endif
