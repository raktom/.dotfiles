"#############################################################################
"#  ~/.vimrc                                                                 #
"#############################################################################
"#                                                                           #
"#  VIM init-config file                                                     #
"#  -----------------------------------------------------------------------  #
"#  Author: Tomasz Rak                                                       #
"#                                                                           #
"#############################################################################

syntax enable
filetype plugin indent on
set spelllang=en,pl,de
set updatetime=500
set termguicolors
packadd! dracula
colorscheme dracula
set laststatus=2
set noshowmode
set splitright
set splitbelow
set colorcolumn=80
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
set noexpandtab
set ignorecase smartcase
set scrolloff=3
set wildignorecase
set noswapfile
set nobackup
set undofile


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
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
let mapleader = ","
let maplocalleader = "\\"
highlight NonText ctermfg=DarkGray guifg=#4a4a59
highlight SpecialKey ctermfg=DarkGray guifg=#4a4a59
set listchars=tab:\|\ ,space:·,nbsp:␣,trail:•,eol:¬,precedes:«,extends:»
set list

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
nnoremap j gj
nnoremap k gk
noremap! ii <C-c>
noremap! jk <C-c>
vnoremap ii <C-c> 
noremap <Space> 10j
noremap <c-Space> 10k
nnoremap Y y0$
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
map { <Nop>
map } <Nop>
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
nmap <c-s> :w<CR> :echo " File saved! "<cr>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s> :echo " File saved! "<cr>


iabbrev @@ raktom0@gmail.com
iabbrev ccopy Copyright 2021 Tomasz Rak, all rights reserve.
iab data <c-r>=strftime('%Y-%m-%d')<cr>

source /usr/share/doc/fzf/examples/fzf.vim

