" Make with markdown_py if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=markdown_py\ %\ >\ %:r.html
endif
