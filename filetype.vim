if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.md setfiletype markdown
  " I'm just not that into Perl
  autocmd! BufNewFile,BufRead *.pl setfiletype prolog
augroup END
