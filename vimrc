call pathogen#infect()
execute pathogen#infect()

set paste
set number
set laststatus=2 " shows the status line, which shows the current file name

" when using vimgrep you can Ctr+N or P for moving between the results.
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

nmap <F2> :noh
nmap <F3> :vimgrep/<C-R><C-W>/g  **/*.clj ../../../test/sf_plus/test/**/**.clj
nmap <F5> :vimgrep/<C-R><C-W>/g  src/**/*.clj test/**/*.clj
nmap <F6> :vimgrep/<C-R><C-W>/g  **/*.clj

set cursorline
set scrolloff=2 " 2 lines above and below cursor

set nobackup

set background=dark
" solarized options
colorscheme solarized

" whitespaces instead of a TAB (ruby code consistency)
set et

" Yannicks .vimrc:
" https://github.com/xsc/.dotfiles/blob/master/vim/.vimrc
"
" Microbe Bundles
"bundle altercation/vim-colors-solarized
"bundle bling/vim-airline
"bundle guns/vim-clojure-static
"bundle Shougo/unite
"bundle Shougo/vimproc.vim
"bundle tpope/vim-fireplace
"bundle tpope/vim-fugitive
"bundle paredit
"bundle christoomey/vim-tmux-navigator
"bundle vim-startify

" This is vimrc_example.vim

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


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
  filetype plugin indent on

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

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" editing ruby code was very slow, so added this code (from http://haerench.blogspot.de/2012/12/cursorline-cursorcolumn-and-syntax.html)

let g:boostmove=0
set updatetime=50
au CursorMoved * call BoostMoveON()
au CursorMovedI * call BoostMoveON()
au CursorHold * call BoostMoveOFF()
au CursorHoldI * call BoostMoveOFF()
function BoostMoveON()
        if (g:boostmove == 0)
                let g:boostmove=1
                setlocal nocursorline
        endif
endfunction
function BoostMoveOFF()
        if g:boostmove==1
                let g:boostmove=0
                setlocal cursorline
        endif
endfunction

" stackoverflow.com/questions/8536711/how-to-autoindent-ruby-source-code-in-vim/8538718#8538718

set smartindent

set tabstop=2

"https://www.ruby-forum.com/topic/50720
" ts = tabstop
" sf = shifhtwidth
" sts = softtabstop
" e = expandtab
set ts=2 sw=2 sts=2 et

" Remove trailing spaces automagically.
autocmd BufWritePre * :%s/\s\+$//e

let g:clojure_align_subforms=1

" autocmd FileType clojure setlocal cc=80
