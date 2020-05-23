" Make with markdown Perl script if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=Markdown.pl\ --html4tags\ %\ >\ %:r.html
endif
inoremap <buffer> ç &ccedil;
inoremap <buffer> Ç &Ccedil;
inoremap <buffer> à &agrave;
inoremap <buffer> À &Agrave;
inoremap <buffer> è &egrave;
inoremap <buffer> È &Egrave;
inoremap <buffer> ò &ograve;
inoremap <buffer> é &eacute;
inoremap <buffer> É &Eacute;
inoremap <buffer> ê &ecirc;
inoremap <buffer> Ê &Ecirc;
inoremap <buffer> î &icirc;
inoremap <buffer> Î &Icirc;
inoremap <buffer> ô &ocirc;
inoremap <buffer> Ô &Ocirc;
inoremap <buffer> Ä &Auml;
inoremap <buffer> Ë &Euml;
inoremap <buffer> Ï &Iuml;
inoremap <buffer> Ö &Ouml;
inoremap <buffer> Ü &Uuml;
inoremap <buffer> ä &auml;
inoremap <buffer> ë &euml;
inoremap <buffer> ï &iuml;
inoremap <buffer> ö &ouml;
inoremap <buffer> ü &uuml;
