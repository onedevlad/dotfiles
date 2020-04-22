call plug#begin('~/.vim/plugged')
Plug 'wesQ3/vim-windowswap' "<leader>ww
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-commentary'
Plug 'sickill/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
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
"Plug 'Twinside/vim-haskellConceal'
Plug 'dense-analysis/ale'
Plug 'vifm/vifm.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
call plug#end()

source ~/.vim/config/plugins.vim
