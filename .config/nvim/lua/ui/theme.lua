vim.opt.termguicolors = true

vim.cmd "colorscheme darkplus"

local hl = vim.api.nvim_set_hl
local c = require('darkplus.palette')

hl(0, "Whitespace", { fg = c.border })
hl(0, "CursorLine", { bg = c.alt_bg })
hl(0, "NvimTreeCursorLine", { bg = c.alt_bg })
hl(0, "Visual", { bg = c.border })
hl(0, "VertSplit", { fg = c.border })
hl(0, "NvimTreeWinSeparator", { fg = c.border })

hl(0, "NvimTreeNormal", { bg = c.bg })
hl(0, "TelescopeNormal", { bg = c.bg })
hl(0, "NvimTreeGitNew", { fg = c.fg })
hl(0, "NvimTreeNormalFloat", { fg = 'NONE', bg = 'NONE' }) -- Padding at the very top
hl(0, "NvimTreeStatusLine", { fg = 'NONE', bg = 'NONE' })
hl(0, "lualine_c_inactive", { fg = c.context, bg = c.bg })

hl(0, "GitSignsAdd", { fg = '#1d5426' })
hl(0, "GitSignsDelete", { fg = '#6a1d1c' })

hl(0, "DiffAdd", { fg = 'NONE', bg = "#393E37" })
hl(0, "DiffChange", { fg = 'NONE', bg = "#2D4050" })
hl(0, "DiffDelete", { fg = 'NONE', bg = "#3F2C2C" })
hl(0, "DiffText", { fg = 'NONE', bg = "#5F3939" })
