" Insert closing parens
inoremap <buffer> {<CR> {<CR>}<Esc>O
" Make with javac if no Makefile present
if !filereadable(expand('%:p:h').'/Makefile')
  setlocal makeprg=javac\ -Xlint\ %
endif

" Abbreviations
iabbrev <buffer> Ar Arrays
iabbrev <buffer> Bo Boolean
iabbrev <buffer> Ch Character
iabbrev <buffer> In Integer
iabbrev <buffer> Li List
iabbrev <buffer> Lo Long
iabbrev <buffer> Qu Queue
iabbrev <buffer> Sc Scanner
iabbrev <buffer> St String

iabbrev <buffer> AL ArrayList
iabbrev <buffer> BI BigInteger
iabbrev <buffer> HM HashMap
iabbrev <buffer> HS HashSet
iabbrev <buffer> LL LinkedList
iabbrev <buffer> PQ PriorityQueue
