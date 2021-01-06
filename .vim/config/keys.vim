let mapleader="," " Map <Leader> (\ by default) to comma

" Allow jk to be used instead Esc to switch to NORMAL mode
inoremap jk <esc>

" Quick editing and reloading vimrc
nmap <silent> <leader>ev :e ~/.vim/config<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Find merge conflict markers
nmap <silent> <leader>c <ESC>/\v^[<=>]{7}( .*\|$ )<CR>

" Unf*ck tmux keybindings highjack
map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;5D <C-Left>
map [1;5C <C-Right>

" Resize vsplit
nnoremap <C-Left> :exe "vertical resize -2"<CR>
nnoremap <C-Right> :exe "vertical resize +2"<CR>

" Resize hsplit
nnoremap <C-Up> :exe "resize -2"<CR>
nnoremap <C-Down> :exe "resize +2"<CR>


" Allows you to enter sudo pass and save the file when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %


" Map :x to :bd -- deletes buffer upon exit
cnoreabbrev x bd


" Open new splits
nmap <silent> <leader>v :vs<CR>
nmap <silent> <leader>h :sp<CR>


" Saving files with `CTRL-S`
nnoremap <silent> <C-S> :<C-u>Update<CR>
nmap <c-s> :w<CR>

" Map ; to : to omit pressing Shift every time
nnoremap ; :

" Map `,/` to clear last search highlight
nmap <silent> ,/ :nohlsearch<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Move lines up and down w/ Ctrl+K, Ctrl+J in visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Use `P` to put register content on the next line
nmap P :pu<CR>



" ****** TEXT EDITING *****

" Allow to copy/paste to system clipboard
set clipboard=unnamedplus
noremap <Leader>y "+y
noremap <Leader>p "+p
map <C-v> "+p
map <C-c> "+y

" Prevent `d` and `x` from cutting text instead of deleting
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x

" Use `X` for cutting text
nnoremap X "+x
vnoremap X "+x
