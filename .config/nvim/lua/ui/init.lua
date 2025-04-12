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

require("vimade").setup({
  fadelevel = 0.5,
  blocklist = {
    nvimtree = {
      buf_name = { 'NvimTree', 'nofile' },
    },
    bufferline = {
      highlights = { '/^BufferLine.*/' },
    }
  }
})

require('ui.theme')
