"#############################################################################
"#  ~/.vimrc                                                                 #
"#############################################################################
"#                                                                           #
"#  VIM init-config file                                                     #
"#  -----------------------------------------------------------------------  #
"#  Author: Tomasz Rak                                                       #
"#                                                                           #
"#############################################################################

set nocompatible
syntax enable
filetype plugin indent on
set spelllang=en,pl,de
set updatetime=500
set termguicolors
set laststatus=2
set noshowmode
set showcmd
set wildmenu
set splitright
set splitbelow
let &colorcolumn="80,".join(range(120,999),",")
set cursorline
set nohlsearch
set errorbells
set visualbell
set belloff=esc
set confirm
set hidden
set mouse=a
set backspace=indent,eol,start
set shiftwidth=4 tabstop=4 
set scrolloff=3
set sidescroll=3
set wildignorecase
set noswapfile
set nobackup
set undofile

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'spell', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set rtp+=~/.fzf
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
set clipboard=unnamedplus
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
"set listchars=tab:\|\ ,space:·,nbsp:␣,trail:•,eol:¬,precedes:«,extends:»
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
"set listchars=tab:→\ ,eol:↲
set list
set showbreak=↪
highlight NonText ctermfg=Black guifg=#000000 
highlight SpecialKey ctermfg=Black guifg=#000000 

let mapleader = ","
let maplocalleader = "\\"
" to switch between buffers
nnoremap <leader><leader> <c-^>
noremap <leader>y "+y
noremap <leader>p "+p
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :echo "!! Reloading .vimrc !!"<cr>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap j gj
nnoremap k gk
noremap! ii <C-c>
noremap! jk <C-c>
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
noremap <Space> 10j
noremap <c-Space> 10k
nnoremap Y y$
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
map $ <Nop>
map ^ <Nop>
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>
"nmap <C-s> :w<CR> :echo " File saved! "<cr>
"map <C-s> <Esc><C"s>gv
"map <C-s> <Esc><c-s> :echo " File saved! "<cr>

iabbrev @@ raktom0@gmail.com
iabbrev ccopy Copyright 2021 Tomasz Rak, all rights reserve.
iab data <c-r>=strftime('%Y-%m-%d')<cr>
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 7 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=7000
au InsertLeave * let &updatetime=updaterestore

" PLUGINS with Plug
"PlugInstall [name ...] [#threads] 	Install plugins
"PlugUpdate [name ...] [#threads]  	Install or update plugins
"PlugClean[!]                      	Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade                       	Upgrade vim-plug itself
"PlugStatus                        	Check the status of plugins
"PlugDiff                          	Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path]     	Generate script for restoring the current snapshot of the plugins
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme dracula
source /usr/share/doc/fzf/examples/fzf.vim

