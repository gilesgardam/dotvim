if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.md setfiletype markdown
  " I'm just not that into Perl
  autocmd! BufNewFile,BufRead *.pl setfiletype prolog
  " but sage is alright
  autocmd! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
  " and GAP can come too
  autocmd! BufRead,BufNewFile *.gap,*.gi,*.gd setfiletype gap
augroup END
