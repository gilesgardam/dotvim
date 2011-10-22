" Essentials
"
call pathogen#infect()
set nocompatible
" Add support for the Go programming language
set rtp+=$GOROOT/misc/vim
syntax on
filetype plugin indent on
set nomodeline
" Behave yourself, backspace!
set backspace=indent,eol,start
set ttyfast
" To wrap lines nicely (don't break words)
set linebreak
" To navigate wrapped lines easily
nnoremap j gj
nnoremap k gk
" Make windows equal after resize
au VimResized * exe "normal \<c-w>="


" Bells and whistles
"
set title
set wildignore=*.swp,*.bak,*.pyc,*.class,*.aux,*.log
" Toggle INSERT (paste) mode (to avoid autoindents etc.)
set pastetoggle=<F2>


" Spelling
"
set spelllang=en
" Toggle spelling
nnoremap <F3> :set spell!<CR>


" Gundo
"
nnoremap <F5> :GundoToggle<CR>


" Tags for my personal wiki (abusing vim's help format)
"
set tags=tags\ ~/wiki/tags
autocmd BufWritePost ~/wiki/* :helptags ~/wiki
autocmd BufNewFile,BufRead ~/wiki/* set filetype=help


" Colours
"
set background=dark


" Indentation
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab


" Searching
"
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch " can get rather annoying, so we map a leader command below
" Make search 'very magic', i.e. mostly Perl-like regex
" nnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %


" Context
"
set ruler
set showcmd " show partial commands
set wildmenu
set wildmode=list:longest


" Some little mappings
"
" FTFY
nnoremap Y y$
" It is annoying to overwrite the default register when
" you delete a single character using 'x', but it is also
" annoying not to be able to use xp to swap adjacent characters...
nnoremap X "_x
" Reselect visual after indenting so we can indent some more
vnoremap < <gv
vnoremap > >gv
" Break undo sequence for <C-u> and <C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>


" From Drew Neil's http://vimcasts.org/
"
" Automatically source my vimrc file after writing to any file called .vimrc
autocmd bufwritepost .vimrc source $MYVIMRC


" Apply strict formatting hints
"
" Highlight trailing whitespace, but not in INSERT mode
highlight default link TrailingWhitespace Error
match TrailingWhitespace /\s\+$/
augroup filetypedetect
autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
autocmd InsertEnter * match none
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" Java specific
"
" Insert closing parens
autocmd Filetype java inoremap <buffer> {<CR> {<CR>}<Esc>O


function! s:doStuff()
  if &ft == 'java'
    execute 'write'
    execute '!javac %'
    execute '!java %:r'
  elseif &ft == 'python'
    execute 'write'
    execute '!python %'
  elseif &ft == 'tex'
    execute 'write'
    execute '!pdflatex %'
  elseif &ft == 'go'
    execute 'write'
    execute '!8g %; 8l %:r.8; ./8.out'
  else
    echo 'Sorry, this does not look like a file I can handle!'
  endif
endfunction

" Leader maps
"
let mapleader = ","
" Clear the highlighting after a search
nnoremap <silent> <leader>\ :nohlsearch<CR>
" Convenient black hole access
nnoremap <leader>b "_
" Write and compile this Java file
nnoremap <leader>c :w<CR>:!javac %<CR>
" Get the current date in the locale's format (e.g. 31/12/99)
nnoremap <leader>d :r!date +\%x<CR>
" Get the current full date and 'underline' with ========
nnoremap <leader>D :r!date<CR>yypVr=
" Duplicate the current line and change \begin to \end (LaTeX hack)
nnoremap <leader>e yyp^cfn\end<Esc>
" Fold the {} you are inside
nnoremap <leader>f zfa}
" NERDTree
nnoremap <leader>n :NERDTree<CR>
" Open file under the cursor in a new tab
nnoremap <leader>o <C-w>gf
" Quit
nnoremap <leader>q :q<CR>
" Prepare to open a file in a new tabe
nnoremap <leader>t :tabe 
" Open the vimrc for editing in a new tab
nnoremap <leader>v :tabnew $MYVIMRC<CR>
" Write the current file
nnoremap <leader>w :w<CR>
" Do stuff according to file type (save/compile/run)
nnoremap <leader>z :call <SID>doStuff()<CR>
" 'Underline' with ======== (1 for <h1>Heading</h1>)
nnoremap <leader>1 yypVr=
" 'Underline' with -------- (2 for <h2>Heading</h2>)
nnoremap <leader>2 yypVr-
" Hard-wrap paragraphs of text (8 for 80)
nnoremap <leader>8 gqip
" Prepare to repeat last command
nnoremap <leader>; :<UP>
