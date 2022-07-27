vim.opt.termguicolors = true

vim.cmd "colorscheme darkplus"

local C = require('darkplus.palette')
local util = require('darkplus.util')

util.initialise({
  Whitespace = { fg = C.dark_gray },
  Visual = { bg = C.dark_gray },
  VertSplit = { fg = C.dark_gray, bg = C.dark_gray },
  BufferLineFill = { bg = C.bg },
  NvimTreeNormal = { bg = C.bg },
  NvimTreeGitNew = { fg = C.fg }
})
