
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  " set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme distinguished	

set ignorecase smartcase
set foldmethod=manual
set expandtab
set shiftwidth=2
set softtabstop=2
set clipboard=unnamedplus
set number
set nowrap
set backupdir=~/tmp

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
highlight Search ctermbg=Black

"Key-bidnings
nnoremap <silent><F3> :NERDTreeToggle<CR>
nnoremap <silent><F4> :e!<CR>
nnoremap <silent><F5> :w<CR>
nnoremap <silent><F7> :qa<CR>
nnoremap <silent><F8> :q!<CR>
nnoremap <silent><S-F8> :qa!<CR>
nnoremap <C-W>Q :qa!<CR>
nnoremap <silent> <C-N> :cnf<CR>zv
nnoremap <silent> <C-P> :cpf<CR>zv

nmap <silent><C-H> gT
nmap <silent><C-L> gt

inoremap <leader>; <C-O>:s/\([^;\s]\)\s*$/\1;/<CR><End>
nnoremap <silent><C-W>` :NERDTreeFind<CR>

nnoremap <F2> :noh<CR>

" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

let g:proj_flags='istg'

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

set encoding=utf-8
set cm=blowfish
