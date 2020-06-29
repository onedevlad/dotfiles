let $PATH = $PATH . ':' . expand("~/.local/bin") . ':' . expand("~/.composer/vendor/bin") . ':' . expand("~/.cabal/bin")

syntax on
filetype plugin indent on

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

set autoindent " Use smart indentation
set cmdheight=1

" Default positions for new splits
set splitbelow splitright

if has('persistent_undo')
  silent !mkdir /tmp/vim > /dev/null 2>&1
  set undodir=/tmp/vim
  set undofile
endif
