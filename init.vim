set nocompatible

call plug#begin(expand('~/.config/nvim/plugged'))

" colorscheme
Plug 'arcticicestudio/nord-vim'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" linting and syntax highlighting
" Plug 'w0rp/ale'

" completion
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Herringtondarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/echodoc.vim'

" helpers
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'ciaranm/detectindent'
Plug 'moll/vim-bbye'
Plug 'airblade/vim-rooter'

" UI
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on

set tags=.git/tags

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set backspace=indent,eol,start

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

autocmd BufReadPost * :DetectIndent 

let mapleader='\'

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/bash
endif

syntax on
set ruler
set number
set relativenumber
set signcolumn=yes


"" Status bar
set laststatus=2
set cmdheight=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Movement mappings
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


"""""""""""""""""""""""""
" Plugin Configurations "
"""""""""""""""""""""""""
" colorscheme
set t_Co=256
colorscheme nord


" nerdtree

" open nerdtree when no file is opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim when only nerdtree tab remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

map <C-_> <leader>c<space>

" ale
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" deoplete
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option('sources', {
            " \ '_': ['ale'],
            " \})

" echodoc
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'

" airline
let g:airline_theme='base16_nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1

" fzf
let g:fzf_buffers_jump = 1
nnoremap <C-p> :Files<CR>
set rtp+=/usr/local/opt/fzf

" LanguageClient-Neovim
" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['$HOME/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    " \ 'javascript': ['typescript-language-server', '--stdio'],
    " \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
    " \ 'typescript': ['typescript-language-server', '--stdio'],
    " \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    " \ }

" function SetLSPShortcuts()
" endfunction()

" augroup LSP
    " autocmd!
    " autocmd FileType rust,typescript,typescriptreact,javascript,javascriptreact call SetLSPShortcuts()
" augroup END

" coc
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" bbye
noremap <leader>q :Bdelete<CR>

" automatically generate ctags for php projects
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" vim: ft=vim
