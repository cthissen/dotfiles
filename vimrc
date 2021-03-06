" Set standard file encoding
set encoding=utf8
" No special per file vim override condifs
set nomodeline 
" Stop word wrapping 
set nowrap
  " except on markdown 
  autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard 
set clipboard=unnamed 
" set tab width and convert tabs to spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab 
" Don't let vim hide characters or make ding sounds 
set conceallevel=1
set noerrorbells
" number gutter 
set number 
" use search highlighting 
set hlsearch
" space above/beside cursor from screen edges 
set scrolloff=1 
set sidescrolloff=5

" show quotes in json 
set conceallevel=0

" set color at max width (black defaults to 88)
set colorcolumn=100

" width for reflow text (I like 80 best) 
"set textwidth=80  
"set nowrap  " but don't automatically wrap the lines

""" opinionated defaults 
let mapleader="\<SPACE>"
" disable mouse support
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" set arrow keys to resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""" dealing with buffers /tabs 
" return to last file openend 
nmap <Leader><Leader> <c-^>
" next/prev buffer (tab to switch to next buffer, shift tab for prev)
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

""" Plugins 
call plug#begin('~/.local/share/nvim/plugged')
" plugins go here 
"Unite (required for plugins to open panels, etc
Plug 'Shougo/unite.vim'
"dracula theme 
Plug 'dracula/vim' 
" Indent guides 
Plug 'Yggdroot/indentLine' 
" Git gutter 
Plug 'airblade/vim-gitgutter'
" Tabs and a status bar 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" fuzzy finder 
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP'}
" find in file 
Plug 'mhinz/vim-grepper' 
" project as file tree 
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
" autocomplete 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} 
" async linting as you type 
Plug 'w0rp/ale'
" efficient moving 
Plug 'justinmk/vim-sneak'
" add pane navigation 
Plug 'christoomey/vim-tmux-navigator'
" python code folding 
"Plug 'tmhedberg/simplyfold'
Plug 'https://github.com/tmhedberg/SimpylFold.git'
" ctags for vim
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
call plug#end()

let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=1
let g:SimpylFold_fold_import=1
"nnoremap <space> za
"vnoremap <space> zf


color Dracula 
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"
" show current mode, current filepath % scrolled, tabs for current buffer,
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
" fuzzer finder settings (space t or space p opens fuzzy finder) 
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR> 
" find in file (silver search, ag) 
" space f p to find matches in Project 
" space f b to find matches in Buffer 
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>
" file tree 
" space ` to toggle file tree 
" space ~ to open file tree from current buffer dir 
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>
" auto complete settings 
let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" 
"    f <key> to jump to next <key>
"    F <key> to jump to previous <key>
"    f to following match
"    s <key><key> to jump to next <key><key>
"    S <key><key> to jump to previous <key><key>
"    s to following match
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" remap jk to <Esc>
:imap jk <Esc>

" try to fix split navigation 
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>


