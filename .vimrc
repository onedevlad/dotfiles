execute pathogen#infect()
" ***** GLOBAL CONSTANTS *****

let $PATH = $PATH . ':' . expand("~/.local/bin") . ':' . expand("~/.composer/vendor/bin") . ':' . expand("~/.cabal/bin")



" ***** PLUG *****

call plug#begin('~/.vim/plugged')
Plug 'wesQ3/vim-windowswap' "<leader>ww
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-commentary'
Plug 'sickill/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'szw/vim-maximizer'
Plug 'Twinside/vim-haskellConceal'
Plug 'dense-analysis/ale'
call plug#end()


" ***** SETTINGS *****

syntax on
filetype plugin indent on
autocmd vimenter * NERDTree

" Enable showing filenames
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

let g:rainbow_active = 1

" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

set number    " Show line numbers
set showmatch " Show matching parenthesis
set smartcase " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase " Ignore search term case
set hlsearch  " Highlight search terms
set incsearch " Show search matches as you type

" Don't redraw while executing macros (good performance config)
set lazyredraw
set cursorline
set showcmd

" Set tab size to 2
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Highlight 80th row
set colorcolumn=80

colorscheme monokai
set autoindent " Use smart indentation
set cmdheight=1
set t_Co=264

" Define non-printable characters to be shown
set list listchars=tab:>-,space:·

" Define non-printable characters' colors, should run after colorscheme is set
hi SpecialKey ctermfg=8 ctermbg=NONE

" Default positions for new splits
set splitbelow
set splitright


" ***** KEY BINDINGS *****

let mapleader="," " Map <Leader> (\ by default) to comma

" Allow jk to be used instead Esc to switch to NORMAL mode
inoremap jk <esc>

" Quick editing and reloading vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$ )<CR>

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


" ***** PLUGINS *****

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Buffergator
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

" NERDTree
let NERDTreeMinimalUI = 1
nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2

" Ack
nnoremap <leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

"VIM-commentary
autocmd FileType vue setlocal commentstring=//\ %s

"YouCompleteMe
set completeopt-=preview

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s)
nmap a <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-bd-tl)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" SexyScroller
let g:SexyScroller_ScrollTime = 10
let g:SexyScroller_CursorTime = 5
let g:SexyScroller_MaxTime = 300
let g:SexyScroller_EasingStyle = 3
let g:SexyScroller_DetectPendingKeys = 1

" Maximizer
set winminwidth=0
set winminheight=0
noremap <silent> <Leader>m :MaximizerToggle!<CR>

" Emmet
" let g:user_emmet_mode='in'

" Vim-repeat
" Example:
" nnoremap <silent> <Plug>SurroundWordWithApostrophe  viw<esc>a'<esc>hbi'<esc>lel
" \ :call repeat#set("\<Plug>SurroundWordWithApostrophe", v:count)<cr>
" nmap <Leader>'  <Plug>SurroundWordWithApostrophe

" ALE
let g:ale_enabled = 0
let b:ale_linter_aliases = ['javascript', 'vue']
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 0
nnoremap <leader>l :ALEToggle<CR>:ALELint<CR>
" nnoremap <leader>lr :ALEDisable<CR>

" ***** GLOBAL *****

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
call pathogen#helptags()
endif
