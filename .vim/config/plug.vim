call plug#begin('~/.vim/plugged')

" Visual
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'szw/vim-maximizer'
Plug 'luochen1990/rainbow'

" General purpose
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vifm/vifm.vim'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wesQ3/vim-windowswap' "<leader>ww

" Movement
Plug 'junegunn/vim-easy-align'
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" IDE
Plug 'ternjs/tern_for_vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Syntax
Plug 'leafgarland/typescript-vim'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
"Plug 'Twinside/vim-haskellConceal'
call plug#end()

source ~/.vim/config/plugins.vim
