vim.opt.termguicolors = true

vim.cmd "colorscheme darkplus"

local hl = vim.api.nvim_set_hl
local c = require('darkplus.palette')

hl(0, "Whitespace", { fg = c.dark_gray })
hl(0, "Visual", { bg = c.dark_gray })
hl(0, "VertSplit", { fg = c.dark_gray, bg = c.alt_bg })

hl(0, "NvimTreeNormal", { bg = c.bg })
hl(0, "TelescopeNormal", { bg = c.bg })
hl(0, "NvimTreeGitNew", { fg = c.fg })
hl(0, "lualine_c_inactive", { fg = c.context, bg = c.bg })
