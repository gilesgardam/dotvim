" Note that the standard cpp.vim calls this ftplugin, so might as well
" put all the c++ stuff in here.
"
" Load settings for 'C-like' languages
source ~/.vim/ftplugin/c-like.vim
" Make with gcc/g++ if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  if &ft=="c"
    setlocal makeprg=gcc\ -std=c99\ -Wall\ %\ \-o\ %:r.out
  elseif &ft=="cpp"
    setlocal makeprg=g++\ -Wall\ %\ \-o\ %:r.out
  endif
endif
