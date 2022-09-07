vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.showmatch = true  -- Show matching parenthesis
vim.opt.smartcase = true  -- Ignore case if search pattern is all lowercase, case sensitive otherwise
vim.opt.ignorecase = true -- Ignore search term case
vim.opt.hlsearch = true   -- Highlight search terms
vim.opt.incsearch = true  -- Show search matches as you type

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true
vim.opt.cursorline = true
vim.opt.showcmd = true

vim.opt.re = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Can't set from Lua yet
vim.cmd("set colorcolumn=81")
vim.opt.list = true
vim.opt.listchars = "tab:>-,space:·"
vim.opt.fillchars:append("vert:▕")
vim.opt.fillchars:append("diff:/")

-- Hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
local _group = vim.api.nvim_create_augroup("LineNumber", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = false
  end,
  once = true,
  group = _group,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = true
  end,
  once = true,
  group = _group,
})

require('ui/theme')
require('../pkg.colorizer')
