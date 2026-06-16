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
