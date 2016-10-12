" File: ~/.vimrc
" Author: Jason Charney (jrcharneyATgmailDOTcom)
" Date: 22 Nov 2015
" Visit https://jrcharney.github.io/hacktop/ for more info
" Info: Vim startup settings.  Some basic ones you will definitely need or else things will be weird.
"       Use this for root.  If you have SPF13 or Janus installed, don't use this
"       use ~/.vimrc.local instead otherwise, you can use this file.
"       If you have some suggestions on how to make this, shoot me an email.
"       Keep it simple! No plug-ins, please.
" Installation Instructions:
"       cp .vimrc ~
"       sudo .vimrc /root
set nocp                    " Use Vim defaults
set shell=/bin/bash         " Set the shell to Bash
set bg=dark                 " set background to dark
filetype plugin indent on   " Automatically detect file types
syntax on                   " Use code syntax
set showmode                " Show the current mode in the status line
set nu                      " Enable line numbers
set ai                      " Enable auto-indent
set sc                      " Show partial commands
set noincsearch             " Do not search as you time. (Learn RegEx, it is better.)
set noexpandtab             " Do not expand tabs into spaces
set backspace=indent,eol,start  " Have backspace work like in most other applications

" set ruler		" show the position of the cursor in the status line
" TODO Look into 'set rulerformat'

" Always show the statusline
set laststatus=2

" The below lines should only work if you are using powerline or 256 color
" terminals. If it is too much to handle, commen them out.

" If your terminal supports 256 colors, use them
if ( $TERM == "xterm-256color" || $TERM == "screen-256color" )
	set t_Co=256

	" Enable powerline too, since we can.
	set rtp+=/usr/share/powerline/bindings/vim/
endif
