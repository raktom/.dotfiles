"##############################################################################
"#  ~/.vimrc                                                                  #
"##############################################################################
"#                                                                            #
"#  VIM init-config file                                                      #
"#  ------------------------------------------------------------------------  #
"#  Author: Tomasz Rak                                                        #
"#                                                                            #
"##############################################################################

if &compatible
	set nocompatible
endif
set noswapfile
set nobackup
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif     
"set undofile
"set undodir=/tmp//
set termguicolors
set guifont=CaskaydiaCove\ Nerd\ Font\ 13
set encoding=UTF-8
set spelllang=en,pl,de
set mouse=a
syntax enable
filetype plugin indent on
set updatetime=500
set title
set laststatus=2
set noshowmode
set showcmd
set scrolloff=3
set sidescroll=3
set wildmenu
set wildignorecase
set splitright
set splitbelow
let &colorcolumn="80,".join(range(120,999),",")
set cursorline
set nohlsearch
set ignorecase
set smartcase
set errorbells
set visualbell
set belloff=esc
set confirm
set hidden
set backspace=indent,eol,start
set shiftwidth=4 tabstop=4 
set smarttab
set showmatch
set matchpairs+=<:>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

"let g:fzf_buffers_jump = 1
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

execute "set <F20>=\e[13;2u"
execute "set <F21>=\e[13;5u"
" Shift-Enter(remapped as <F20>) to start editing new line below without splitting the current one
" Ctrl-Enter(remapped as <F21>) to start editing new line above
inoremap <F20> <C-o>o
inoremap <F21> <C-o>O
" default mapleader \ could be changed to space or ,
let mapleader = " " 
let maplocalleader = "\\"
" switch between buffers
nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Files!<CR>
cnoremap <silent> <C-p> :History:<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <F1> :Helptags<CR>
inoremap <silent> <F1> <Esc>:Helptags<CR>
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-k> <plug>(fzf-complete-word)
imap <C-x><C-l> <plug>(fzf-complete-buffer-line)
noremap <leader>y "+y
noremap <leader>p "+p
nnoremap <leader>e :vsplit $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr> :echo "!! Reloading .vimrc !!"<cr>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap ' `
nnoremap ` '
nnoremap j gj
nnoremap k gk
noremap! ii <C-c>
noremap! jk <C-c>
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
noremap <C-Space> 10j
noremap <C-S-Space> 10k
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
nnoremap <leader>q :q<CR>
"nmap <C-s> :w<CR> :echo " File saved! "<cr>
"map <C-s> <Esc><C"s>gv
"map <C-s> <Esc><c-s> :echo " File saved! "<cr>
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
"cnoremap <C-P> <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

" Abbreviations
iab #! #!/bin/bash
iab @@ raktom0@gmail.com
iab ccopy Copyright 2021 Tomasz Rak, all rights reserve.
iab date <c-r>=strftime('%Y-%m-%d')<cr>
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

set rtp+=~/.fzf
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6  }  }
"
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 7 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=7000
au InsertLeave * let &updatetime=updaterestore

if &diff
	let s:is_started_as_vim_diff = 1
	syntax off
	setlocal nospell
	highlight NormalNC guibg=none
endif

let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_markpu_syntax = 'markdown'
let g:markdown_folding = 1

let g:UltiSnipsExpandTrigger="<tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" loading the plugin devicon
let g:webdevicons_enable = 1
let g:lightline#bufferline#enable_devicons = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'spell', 'filetype', 'charvaluehex' ] ]
      \ },
	  \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
	  \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" PLUGINS with Plug
"PlugInstall [name ...] [#threads] 	Install plugins
"PlugUpdate [name ...] [#threads]  	Install or update plugins
"PlugClean[!]                      	Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade                       	Upgrade vim-plug itself
"PlugStatus                        	Check the status of plugins
"PlugDiff                          	Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path]     	Generate script for restoring the current snapshot of the plugins
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme nightfox
lua << EOF
local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- change the colorscheme to use nordfox
  alt_nc = "true",
  terminal_colors = "true",
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = "true", -- inverse the highlighting of match_parens
  },
  colors = {
    red = "#FF000", -- Override the red color for MAX POWER
    bg_alt = "#000000",
  },
  hlgroups = {
    TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
EOF

" Dimming inactive(NC-not current) vim panes
"highlight Normal ctermfg=145 ctermbg=none guifg=#cdcecf guibg=none " guibg=#192330
highlight NormalNC guibg=#3d3e4a

source /usr/share/doc/fzf/examples/fzf.vim
