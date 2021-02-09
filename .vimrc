"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Marcel Yamamoto                                                       "
"                                                                               "
"                                                                               "
" Version: 1.0 - 11/11/2019                                                     "
"                                                                               "
" Source: https://github.com/marcel-yamamoto/dotfiles                           "
"                                                                               "
" Sections:     1. Plugins                                                      "
"               2. General                                                      "
"               3. VIM Interface                                                "
"               4. Binds                                                        "
"               5. Colors and GUI font                                          "
"                                                                               "
"     ___           ___           ___           ___           ___           ___ "
"    /\__\         /\  \         /\  \         /\  \         /\  \         /\__\"
"   /::|  |       /::\  \       /::\  \       /::\  \       /::\  \       /:/  /"
"  /:|:|  |      /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/  / "
" /:/|:|__|__   /::\~\:\  \   /::\~\:\  \   /:/  \:\  \   /::\~\:\  \   /:/  /  "
"/:/ |::::\__\ /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/ \:\__\ /:/\:\ \:\__\ /:/__/   "
"\/__/~~/:/  / \/__\:\/:/  / \/_|::\/:/  / \:\  \  \/__/ \:\~\:\ \/__/ \:\  \   "
"      /:/  /       \::/  /     |:|::/  /   \:\  \        \:\ \:\__\    \:\  \  "
"     /:/  /        /:/  /      |:|\/__/     \:\  \        \:\ \/__/     \:\  \ "
"    /:/  /        /:/  /       |:|  |        \:\__\        \:\__\        \:\__\"
"    \/__/         \/__/         \|__|         \/__/         \/__/         \/__/"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                1. Plugins                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Section
call plug#begin('~/.vim/plugged/')

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'danilo-augusto/vim-afterglow'

" GUI, Navigation and typing improvements
Plug 'ervandew/supertab' 
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'

" Lint engine
Plug 'w0rp/ale'


" Syntax Highlight
"
" JavaScript 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" HTML 
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS {{{4
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }


" Deoplete Package - dark powered neo-completion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Language Snippets and Auto-completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" ALE config
 let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_fix_on_save = 1

call plug#end()

" Plugins Configs

" Lightline 
set laststatus=2                    " Lightline [ON] or [OFF]
let g:lightline = {                 
      \ 'colorscheme': 'wombat',    
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'fileformat': ''
      \ },
      \ }

" Deoplete
set pyxversion=3 
let g:deoplete#enable_at_startup = 1
"deoplete#disable()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   2. General                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible
  set history=1000                  " Set how many lines of history remember
  set autoread                      " Set auto read when a file is changed
  syntax on                         " Enable syntax
  set ruler	                    " Show row and column ruler information
  set undolevels=1000	            " Number of undo levels
  set backspace=indent,eol,start    " Backspace behaviour
  set noshowmode                    " No default status message
  set encoding=utf-8                " Char encoding
  set wildmenu                      " Enhanced command line completion
  set wildmode=list:longest         " Complete files like a shell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                3. VIM Interface                               "  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NUMBERS
 set number	                    " Show line numbers

" LINES, WORD WRAP, SYNTAX FIX  
 set showmatch	                    " Highlight matching brackets
 set nowrap                         " No line break   

" SEARCH 
 set hlsearch	                    " Highlight all search results
 set smartcase	                    " Use case sensitive search when using [CAPS] 
 set ignorecase	                    " Always case-insensitive
 set incsearch	                    " Vim will start searching as you type
 
" AUTO INDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
 set smartindent      
 set expandtab
 set softtabstop=2
 set shiftwidth=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   4. Binds                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER KEY
let mapleader=","
nnoremap <CR> :noh<CR><CR>

nnoremap <leader>ft :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             5. Colors and GUI font                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SELECT COLORSCHEME (uncomment the lines of your preference theme)

set termguicolors                        " enable true colors support

"                                  # AYU #                                      "
"let ayucolor="light"                     " for light version of theme
let ayucolor="mirage"                    " for mirage version of theme
"let ayucolor="dark"                      " for dark version of theme

"                               # SELECT YOUR COLORSCHEME #                     "
" available: { dracula, ayu, afterglow, molokai }
colorscheme afterglow 
highlight Error guifg=Red guibg=#1a1a1a

" SELECT FONT (uncomment the line where are the font that you want)
set guifont=Roboto\ Mono\ Light:h18        " Roboto mono - size 18pt
"set guifont=Fira\ Code\ Retina:h16        " Fira Code Retina - size 16pt
set antialias


