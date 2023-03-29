"##############################################################################
"#  ~/.vimrc                                                                  #
"##############################################################################
"#                                                                            #
"#  VIM init-config file                                                      #
"#  ------------------------------------------------------------------------  #
"#  Author: Tomasz Rak                                                        #
"#                                                                            #
"##############################################################################

" be iMproved and use all vim functionality, nvim also reads it
if &compatible
	set nocompatible
endif
set noswapfile 		"swapfile saves not written changes in a case
set directory=$HOME/.vim/swp// "location for swapfiles
set nobackup		"
set backupdir=$HOME/.vim/.backup// "location for backups
if has('persistent_undo')        "check if your vim version supports undo-tree
	set undofile                 "turn on the feature
	set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
set viminfo='100,n$HOME/.vim/info/viminfo "other info saved here
" enable project specific vimrc
"set exrc
set path=.,**
set termguicolors
set guifont="CaskaydiaCove Nerd Font 13"
set encoding=UTF-8
set spelllang=en,pl,de
set complete+=i,kspell
set mouse=a
syntax enable
filetype plugin indent on
" no delays on ESC
set timeoutlen=1000 ttimeoutlen=0
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
set wrapscan
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
au FileType html set sw=2 ts=2 et
set expandtab
set smarttab
set showmatch
set matchpairs+=<:>
" normally y d c p use unnamed reg but 'unnamed' changes to * 'unnemedplus' to +
" X puts selection to PRIMARY -> * and copy (^C) to CLIPBOARD -> +
set clipboard^=unnamedplus
"let g:fzf_buffers_jump = 1

" run templates for empty files of some formats
:autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.tpl
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
:autocmd BufNewFile *.service 0r ~/.vim/templates/service.tpl
:autocmd BufNewFile *.md 0r ~/.vim/templates/md.tpl +4

set number relativenumber
"augroup numbertoggle
"	autocmd!
"	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
"augroup END

"set listchars=tab:\|\ ,space:·,nbsp:␣,trail:•,eol:¬,precedes:«,extends:»
set listchars=tab:\|▸\ ,eol:↲,extends:❯,precedes:❮
"set listchars=tab:→\ ,eol:↲
set list
set showbreak=↪
highlight NonText ctermfg=Black guifg=#000000
highlight SpecialKey ctermfg=Black guifg=#000000
" highlight trailing whitespace
match ErrorMsg '\s\+$'

" default mapleader \ could be changed to space or ,
let mapleader=" "
let maplocalleader="\\"
" switch between buffers
nnoremap <leader><leader> <C-^>

" FZF popup window for searching
" select than to open press: Enter -in current window
" C-v -in vert split; C-x -in horiz split; C-t -in new tab
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
" leader helps in copying
noremap <leader>y "+y
noremap <leader>p "+p
" leader helps edit and reload .vimrc
nnoremap <leader>e :vsplit $HOME/.vimrc<CR>
nnoremap <leader>r :source $HOME/.vimrc<CR> :echo " !! .vimrc RELOADED !! "<CR>
" put word in quotes or parents
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>bi<<esc>lel
" normal mode logical behavior
nnoremap <CR> i<CR><esc>
nnoremap <M-CR> o<esc>
nnoremap <M-o> o<esc>k
nnoremap <leader>o o<esc>k
nnoremap <M-O> O<esc>j
nnoremap <leader>O O<esc>j
nnoremap <M-i> i <esc>l
nnoremap <leader>i  i <esc>l
" swap quote and backtick
nnoremap ' `
nnoremap ` '
" when line wraps then easier move with jk but relative nr??
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
" logical yanking
nnoremap Y y$
" stay inside double thing
inoremap <> <><Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
" move paragraphwise and linewise
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
" move in insert mode
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
" save how you used to
inoremap <C-s>     <C-O>:update<CR>
nnoremap <C-s>     :update<CR> :echo " !! FILE SAVED !! "<CR>
noremap <leader>s :update<CR> :echo " !! FILE SAVED !! "<CR>
nnoremap <leader>w :update<CR> :echo " !! FILE SAVED !! "<CR>
nnoremap <leader>q :q<CR>
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

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" write files without permissions with w!! comand or just suda plugin
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Abbreviations
iab #!/ #!/bin/bash
iab @@ raktom0@gmail.com
iab ccopy Copyright (c) 2021 Tomasz Rak, all rights reserve.
iab date <C-r>=strftime('%Y-%m-%d')<CR>
iab tstp <C-r>=strftime('%Y%m%dT%H%M')<CR>
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" look of fzf in window (popup)
" See `man fzf-tmux` for available options
if exists('$TMUX')
	let g:fzf_layout = { 'tmux': '-p80%,60%' }
else
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
endif
" if we prefer panel at the bottom then
"let g:fzf_layout = { 'down' : '40%' }
"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_preview_window = 'right:50%'

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 7 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=7000
au InsertLeave * let &updatetime=updaterestore

" Netrw settings
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 18
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nonu norelativenumber nowrap nobl'
noremap <silent> <A-f> :call ToggleNetrw()<CR>

function! OpenToRight()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright vnew' g:path
	:normal <C-w>l
endfunction

function! OpenBelow()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright new' g:path
	:normal <C-w>l
endfunction

function! OpenTab()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'tabedit' g:path
	:normal <C-w>l
endfunction

function! NetrwMappings()
	" Hack fix to make ctrl-l work properly
	noremap <buffer> <A-l> <C-w>l
	noremap <buffer> <C-l> <C-w>l
	noremap <silent> <A-f> :call ToggleNetrw()<CR>
	noremap <buffer> V :call OpenToRight()<CR>
	noremap <buffer> H :call OpenBelow()<CR>
	noremap <buffer> T :call OpenTab()<CR>
endfunction

augroup netrw_mappings
	autocmd!
	autocmd filetype netrw call NetrwMappings()
augroup END

" Allow for netrw to be toggled
function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent exe "bwipeout " . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Lexplore
	endif
endfunction

" Check before opening buffer on any file
function! NetrwOnBufferOpen()
	if exists('b:noNetrw')
			return
	endif
	call ToggleNetrw()
endfun

" Close Netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Make netrw act like a project Draw
augroup ProjectDrawer
	autocmd!
	" Don't open Netrw
"	autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/calcurse*,~/.calcurse/notes/*,\
"	    ~/vimwiki/*,*/.git/COMMIT_EDITMSG let b:noNetrw=1
"	autocmd VimEnter ~/.vimrc,~/.tmux.conf,~/.bashrc,~/.input.rc,*.task let b:noNetrw=1
	autocmd VimEnter * :call NetrwOnBufferOpen()
	autocmd VimEnter * :call ToggleNetrw()
augroup END

let g:NetrwIsOpen=0

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
let g:vimwiki_list = [{'path': '~/vimwiki', 
    \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_markup_syntax = 'markdown'
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

let g:floaterm_keymap_new = '<Leader>t'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
" files which need privileges no problem
let g:suda_smart_edit = 1

" PLUGINS with Plug
"
" PlugInstall  	Install plugins
" PlugUpdate   	Install or update plugins
" PlugClean[!] 	Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade  	Upgrade vim-plug itself
" PlugStatus   	Check the status of plugins
" PlugDiff     	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] Generate script for restoring the current snapshot of the plugins
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
Plug 'voldikss/vim-floaterm'
Plug 'dylanaraps/fff.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/suda.vim'
call plug#end()

colorscheme dracula
" Dimming inactive(NC-not current) vim panes
"highlight Normal ctermfg=145 ctermbg=none guifg=#cdcecf guibg=none " guibg=#192330
highlight NormalNC guibg=#3d3e4a

source /usr/share/doc/fzf/examples/fzf.vim
