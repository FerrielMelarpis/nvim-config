call plug#begin(expand('$HOME/.config/nvim/plugged'))

" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" linting and syntax highlighting
" Plug 'w0rp/ale'

" completion
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'Herringtondarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/echodoc.vim'

" php
Plug 'tobys/pdv'

" helpers
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'moll/vim-bbye'
Plug 'airblade/vim-rooter'

" UI
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Nerdtree
" close vim when only nerdtree tab remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" ranger
let g:rnvimr_enable_ex = 1 " replace netrw
let g:rnvimr_enable_picker = 1 " hide after selecting a file
let g:rnvimr_enable_bw = 1 " wipe buffers when removed in ranger

nnoremap <silent> ø :RnvimrToggle<CR>
tnoremap <silent> ø <C-\><C-n>:RnvimrToggle<CR>

" Resize floating window by all preset layouts
tnoremap <silent> ˆ <C-\><C-n>:RnvimrResize<CR>

let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
map <C-_> <leader>c<space>

" airline
let g:airline_theme='tender'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#ale#enabled = 1

" fzf
let g:fzf_buffers_jump = 1
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg<CR>
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
autocmd FileType typescript let b:coc_root_patterns = ['package.json']
autocmd FileType typescriptreact let b:coc_root_patterns = ['package.json']
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)

" bbye
nnoremap <leader>q :Bdelete<CR>
" automatically generate ctags for php projects
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" ale
" let g:ale_fix_on_save = 1
" let g:ale_open_list = 1
" let g:ale_linters_explicit = 1
" let g:ale_history_log_output = 1

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" deoplete
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option('sources', {
            " \ '_': ['ale'],
            " \})

" echodoc
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
