" Make with pdflatex if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=pdflatex\ %
endif
