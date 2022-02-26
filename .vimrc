"##############################################################################
"#  ~/.vimrc                                                                  #
"##############################################################################
"#                                                                            #
"#  VIM init-config file                                                      #
"#  ------------------------------------------------------------------------  #
"#  Author: Tomasz Rak                                                        #
"#                                                                            #
"##############################################################################

" use all vim functionality, nvim also reads it
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
set complete+=i,kspell
set mouse=a
syntax enable
filetype plugin indent on
set updatetime=500
set title
set laststatus=2
set noshowmode
set showcmd
set scrolloff=3
set sidescroll=1
set sidescrolloff=5
set wildmenu
set wildignorecase
set splitright splitbelow
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

" default mapleader \ could be changed to space or ,
let mapleader = " " 
let maplocalleader = "\\"
" switch between buffers
nnoremap <leader><leader> <c-^>
" use fzf window
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :Files!<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <F1> :Helptags<CR>
inoremap <silent> <F1> <Esc>:Helptags<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-k> <plug>(fzf-complete-word)
imap <C-x><C-l> <plug>(fzf-complete-line)
noremap <leader>y "+y
noremap <leader>p "+p
nnoremap <leader>e :vsplit $HOME/.vimrc<cr>
nnoremap <leader>r :source $HOME/.vimrc<cr> :echo "!! Reloading .vimrc !!"<cr>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel

nnoremap <cr> o<esc>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap ' `
nnoremap ` '
nnoremap j gj
nnoremap k gk
" another way to escape
noremap! ii <C-c>
noremap! jk <C-c>
" cursor in center of screen
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
noremap <C-Space> 10j
noremap <S-C-Space> 10k
nnoremap Y y$
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr> :echo " File saved! "<cr>
noremap <leader>s :update<cr> :echo " File saved! "<cr>
nnoremap <leader>w :update<cr> :echo " File saved! "<cr>
nnoremap <leader>q :q<CR>
"nmap <C-s> :w<CR> :echo " File saved! "<cr>
"map <C-s> <Esc><C"s>gv
" emacs style command line movements
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <silent> <C-p> :History:<CR>
"cnoremap <C-P> <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>
" write files without permissions with w!! comand
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Abbreviations
iab #! #!/bin/bash
iab @@ raktom0@gmail.com
iab ccopy Copyright 2021 Tomasz Rak, all rights reserve.
iab date <c-r>=strftime('%Y-%m-%d')<cr>
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

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
" Markdown Preview settings
" set to 1, nvim will open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
let g:mkdp_open_ip = ''
" specify browser to open preview page
let g:mkdp_browser = 'chromium'
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" vimwiki settings
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_markpu_syntax = 'markdown'
let g:markdown_folding = 1
" use <Tab> to trigger autocompletion
let g:UltiSnipsExpandTrigger="<C-J>"
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
" make sure that you have the latest version of the binary,
" it gives :FZF command for basic file search
" C+x -opens in new split, C+v -new vert-split, C-+t -new tab
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" gives lots of commands like :Files :Gfiles ...
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
