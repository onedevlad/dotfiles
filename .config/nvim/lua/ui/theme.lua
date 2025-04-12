local hl = vim.api.nvim_set_hl
local c = require("ui.colors")

vim.cmd("colorscheme darkplus")

-- Common
hl(0, "Whitespace", { fg = c.border })
hl(0, "CursorLine", { bg = c.border })
hl(0, "CursorLineNr", { fg = c.ui_white, bold = true })
hl(0, "ColorColumn", { bg = c.border })
hl(0, "Visual", { bg = c.border })
hl(0, "VertSplit", { fg = c.border })

-- Telescope
hl(0, "TelescopeNormal", { bg = c.black })
hl(0, "TelescopeBorder", { bg = c.black, fg = c.border })
hl(0, "TelescopePreviewTitle", { fg = c.light_white })
hl(0, "TelescopePromptTitle", { fg = c.light_white })
hl(0, "TelescopeResultsTitle", { fg = c.light_white })

-- NvimTree
hl(0, "NvimTreeNormal", { bg = c.alt_bg })
hl(0, "NvimTreeWinSeparator", { fg = c.border, bg = c.alt_bg })
hl(0, "WinSeparator", { fg = c.border, bg = c.none })
hl(0, "NvimTreeCursorLine", { bg = c.nav_cursorline })
hl(0, "NvimTreeGitNew", { fg = c.fg })
hl(0, "NvimTreeNormalFloat", { bg = c.alt_bg }) -- Padding at the very top
hl(0, "NvimTreeStatusLine", { bg = c.alt_bg })

-- Status line
hl(0, "lualine_transparent", { bg = c.alt_bg })
hl(0, "lualine_c_inactive", { fg = c.light_white, bg = c.alt_bg })
hl(0, "lualine_x_inactive", { fg = c.light_white, bg = c.alt_bg })
hl(0, "StatusLine", { bg = c.alt_bg })
hl(0, "StatusLineNC", { fg = c.white, bg = c.alt_bg, bold = true })
hl(0, "ModeMsg", { bg = c.alt_bg, fg = c.alt_bg })
hl(0, "MsgArea", { bg = c.alt_bg, fg = c.light_white })

-- Bqf Preview window
hl(0, "BqfPreviewFloat", { bg = c.black, fg = c.light_white })
hl(0, "BqfPreviewBorder", { bg = c.black, fg = c.border })
hl(0, "BqfPreviewTitle", { bg = c.black, fg = c.light_white })
hl(0, "BqfPreviewSbar", { bg = c.black })
hl(0, "BqfPreviewThumb", { bg = c.border })

-- Float windows
hl(0, "NormalFloat", { bg = c.black })
hl(0, "FloatBorder", { bg = c.black, fg = c.border })
hl(0, "MyNormalFloat", { bg = c.black })
hl(0, "MyFloatBorder", { bg = c.black, fg = c.border })

-- Diff view
hl(0, "GitSignsAdd", { fg = c.diff_add })
hl(0, "GitSignsDelete", { fg = c.diff_delete })
hl(0, "GitSignsChange", { fg = c.ui_blue })
hl(0, "DiffAdd", { fg = c.none, bg = "#393E37" })
hl(0, "DiffChange", { fg = c.none, bg = "#2D4050" })
hl(0, "DiffDelete", { fg = c.none, bg = "#3F2C2C" })
hl(0, "DiffText", { fg = c.none, bg = "#5F3939" })
