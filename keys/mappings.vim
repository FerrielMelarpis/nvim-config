" Movement mappings
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <s-up>		:resize -2<CR>
nnoremap <s-down>  	:resize +2<CR>
nnoremap <s-left>   :vertical resize -2<CR>
nnoremap <s-right>  :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <tab> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <s-tab> :bprevious<CR>

" Alternate way to save
nnoremap <leader>w :w<CR> 

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>ev :e $MYVIMRC<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

tnoremap <Esc> <c-\><c-n>
