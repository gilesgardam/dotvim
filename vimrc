" Essentials
"
call pathogen#infect()
set nocompatible
" Add support for the Go programming language
set rtp+=$GOROOT/misc/vim
syntax on
filetype plugin indent on
runtime macros/matchit.vim
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
augroup resizing
  autocmd!
  autocmd VimResized * execute "normal \<C-w>="
augroup END
" Increase command and search pattern history
set history=1000
" Let me hide those modified buffers!
set hidden
" Put backups and swap files in a separate directory
set backupdir=~/tmp
set directory=~/tmp
" Enable awesome
let mapleader = ","
" Don't redraw during macros etc.
set lazyredraw
" Because I have ten fingers, not eight, and like leading zeros
set nrformats=hex


" Bells and whistles
"
set title
set wildignore=*.swp,*.bak,*.pyc,*.class,*.aux
" Toggle INSERT (paste) mode (to avoid autoindents etc.)
set pastetoggle=<F2>
" Status line
set laststatus=2            " always show the status line
set statusline=             " empty the status line
set statusline+=\ %n\ %*    " buffer number
set statusline+=%{&ff}%*    " file format
set statusline+=%y%*        " file type
set statusline+=\ %<%F%*    " full path
set statusline+=%m%*        " modified flag
set statusline+=%=%5l%*     " current line
set statusline+=/%L%*       " total lines
set statusline+=%4c\ %*     " column number
set statusline+=0x%04B\ %*  " character under cursor


" Spelling
"
set spelllang=en
" Toggle spelling
nnoremap <silent> <F3> :set spell!<CR>


" Gundo
"
nnoremap <F5> :GundoToggle<CR>


" Tags for my personal wiki (abusing vim's help format)
"
set tags=tags\ ~/wiki/tags
augroup wiki
  autocmd!
  autocmd BufWritePost ~/wiki/* :helptags ~/wiki
  autocmd BufNewFile,BufRead ~/wiki/* set filetype=help
augroup END

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
set incsearch
set hlsearch " can get rather annoying, so we map a leader command below
" Make search 'very magic', i.e. mostly Perl-like regex
" nnoremap / /\v
" Use tab to jump between matching brackets (destroys <C-i>, see :help ctrl-i)
" nnoremap <tab> %
" vnoremap <tab> %


" Context
"
set ruler
set showcmd " show partial commands
set showmatch
set wildmenu
set wildmode=list:longest


" Filetypes
"
" Vim, don't go thinking I'm using plain ol' tex!
let g:tex_flavor = "latex"


" Some little mappings
"
" Copy visually selected text to system clipboard
vnoremap <C-c> "+y
" Copy entire file to system clipboard
nnoremap <C-c> :% yank +<CR>
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
" Swap ' and ` (` is more useful but less accessible)
" Note that we want to have these done in 'mapmode-nvo', so that they work
" across normal, visual and operator-pending modes.
noremap ' `
noremap ` '
" Comment lines using the vim-commentary plugin
xmap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine
" PANIC!
nnoremap <F9> mzggg?G'z
" Change the case of the current word in insert mode
inoremap <C-u> <ESC>mzg~iw`za
" Escape
inoremap jk <ESC>


" Location
"
" Move between windows
" nnoremap [[ <C-w>w
" nnoremap ]] <C-w>W
nnoremap [w <C-w>h
nnoremap ]w <C-w>l
" Move between files
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>
" Move between buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
" Navigate clist more easily
" (The messing around with QFFocus is there to bring the error message to
" the top of the quickfix window, without moving around in the main window
" if the quickfix window isn't open.)
nnoremap <Plug>QFFocus mzHmy<C-w>jzt<C-w>k'yzt`z
nnoremap <silent> [q :cprevious<CR><Plug>QFFocus
nnoremap <silent> ]q :cnext<CR><Plug>QFFocus
nnoremap <silent> [Q :cfirst<CR><Plug>QFFocus
nnoremap <silent> ]Q :clast<CR><Plug>QFFocus
nnoremap <C-DOWN> :cwindow 5<CR><C-w>k


" Apply strict formatting hints
"
" Highlight trailing whitespace, but not in INSERT mode
highlight default link TrailingWhitespace Error
match TrailingWhitespace /\s\+$/
augroup trailingwhitespace
  autocmd!
  autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
augroup insertwhitespace
  autocmd InsertEnter * match none
  autocmd InsertLeave * match TrailingWhitespace /\s\+$/
augroup END


function! s:runStuff()
  if &ft == 'java'
    execute '!java %:r'
  elseif &ft == 'python'
    execute 'write'
    execute '!python %'
  elseif &ft == 'c'
    execute '!./a.out'
  elseif &ft == 'tex'
    execute '!open %:r.pdf'
  elseif &ft == 'markdown'
    execute '!open %:r.html'
  elseif &ft == 'prolog'
    execute '!swipl %'
  elseif &ft == 'gap'
    execute '!gap -b %'
  elseif &ft == 'lean'
    execute '!lean %'
  else
    echo 'Sorry, this does not look like a file I can handle!'
  endif
endfunction

let g:snipMate = { 'snippet_version' : 1 }

" Leader maps
"
" Quickly switch to previous buffer
nnoremap <leader><leader> <C-^>
" Delete the most recently searched for regex
nnoremap <leader>/d :%s///g<CR>
" Ack the word under the cursor
nnoremap <leader>a :Ack <cword><CR>
" Convenient black hole access
nnoremap <leader>b "_
" Copy the current file to the X clipboard
nnoremap <leader>c :!xclip -selection clipboard %<CR><CR>:echo "Copied to X clipboard"<CR>
" Delete current buffer but preserve split window
nnoremap <leader>d :bp\|bd #<CR>
" Get the current date in the correct short format (e.g. 31/12/99)
nnoremap <leader>DD i<C-r>=strftime('%d/%m/%y')<CR><ESC>
" Get the current full date and 'underline' with ========
nnoremap <leader>DL o<C-r>=strftime('%c')<CR><ESC>:copy.<CR>Vr=
" Use current file as starting point to edit a new one
nnoremap <leader>e :e <C-r>%
" Fold the {} you are inside
nnoremap <leader>F zfa}
" Toggle search highlighting
nnoremap <silent> <leader>h :nohls<CR>
nnoremap <silent> <leader>\ :nohls<CR>
" Highlight a word without moving the cursor
nnoremap <leader>H :let @/=''<Left>
" Visually select text that Just changed
nnoremap <leader>j `[v`]
" Show the list of buffers
nnoremap <leader>l :ls<CR>
" Write and make
nnoremap <leader>m :write<CR>:make<CR>
" Notes file
nnoremap <leader>n :edit ~/.vim/notes.txt<CR>
" Paste on line Below
nnoremap <leader>pb :put "<CR>
" Paste lines of text Inline
nnoremap <leader>pi i<C-r>"<BS><ESC>
" Quit
nnoremap <leader>q :q<CR>
" Choose a recently opened file
nnoremap <leader>r :browse oldfiles<CR>
" Swap with previously deleted text
" WARNING: If you are swapping two chunks of text on the same line, then you
" have to start by deleting the chunk that is first from the left.
vnoremap <leader>s <ESC>`.``gvP``P
" Open the vimrc for editing
nnoremap <leader>v :edit $MYVIMRC<CR>
" Source the vimrc
nnoremap <leader>V :source $MYVIMRC<CR>
" Write the current file
nnoremap <leader>w :w<CR>
" Write and quit
nnoremap <leader>x :x<CR>
" Run the current file's 'binary'
nnoremap <leader>z :call <SID>runStuff()<CR>
" 'Underline' with ======== (1 for <h1>Heading</h1>)
nnoremap <leader>1 yypVr=
" 'Underline' with -------- (2 for <h2>Heading</h2>)
nnoremap <leader>2 yypVr-
" Hard-wrap paragraphs of text (8 for 80)
nnoremap <leader>8 gqip
" Continue [fFtT] search backwards (opposite to ;)
nnoremap <leader>; ,
