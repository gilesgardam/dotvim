" Make with markdown Perl script if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=Markdown.pl\ --html4tags\ %\ >\ %:r.html
endif
