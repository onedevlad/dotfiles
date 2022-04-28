-- Turn off backup, since most stuff is in git anyway...
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.clipboard = 'unnamedplus'

vim.cmd [[ au FocusLost * silent! wa ]]

vim.cmd [[
  if has('persistent_undo')
    silent !mkdir /tmp/vim > /dev/null 2>&1
    set undodir=/tmp/vim
    set undofile
  endif
]]
