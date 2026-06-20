-- Turn off backup, since most stuff is in git anyway...
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true

-- Fixes line shears in wezterm when editing neighboring buffers
vim.opt.termsync = false
vim.env.TERM = "wezterm"

-- Autosave on focus loss
vim.cmd [[ autocmd BufLeave,FocusLost * silent! wall ]]

vim.cmd [[
  if has('persistent_undo')
    silent !mkdir /tmp/vim > /dev/null 2>&1
    set undodir=/tmp/vim
    set undofile
  endif
]]

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.showmatch = true  -- Show matching parenthesis
vim.opt.smartcase = true  -- Ignore case if search pattern is all lowercase, case sensitive otherwise
vim.opt.ignorecase = true -- Ignore search term case
vim.opt.hlsearch = true   -- Highlight search terms
vim.opt.incsearch = true  -- Show search matches as you type

vim.opt.lazyredraw = true
vim.opt.cursorline = true
vim.opt.showcmd = true

vim.opt.re = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Can't set from Lua yet
vim.cmd("set colorcolumn=80")
vim.opt.list = true
vim.opt.listchars = "tab:>-,space:·"
vim.opt.fillchars:append("vert:▕")
vim.opt.fillchars:append("diff: ")

vim.o.winborder = 'none'
vim.opt.number = true
vim.opt.signcolumn = 'number'
