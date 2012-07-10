if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.md setfiletype markdown
augroup END
