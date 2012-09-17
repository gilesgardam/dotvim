if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=gcc\ -std=c99\ -Wall\ %
endif
