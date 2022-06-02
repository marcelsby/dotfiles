set nocompatible
filetype off

" Check if Vundle is installed
if !isdirectory(expand('~/.config/nvim/bundle/Vundle.vim'))
	!git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim	
endif

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'luochen1990/rainbow'

call vundle#end()

syntax on
set encoding=utf-8
set hidden
set shiftwidth=4
set tabstop=4
set number
set hlsearch
set mouse=a

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader="\<space>"
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ev :vs ~/.config/nvim/init.vim<cr>

" Rainbow brackets
let g:rainbow_active = 1
