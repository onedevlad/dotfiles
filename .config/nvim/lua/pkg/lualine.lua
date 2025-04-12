local theme = require('lualine.themes.darkplus')

local fullPath = { { 'filename', path = 1 } };

require('lualine').setup({
  options = {
    theme = theme,
    always_divide_middle = false,
    globalstatus = false,
    disabled_filetypes = { 'NvimTree' },
  },
  inactive_sections = {
    lualine_c = fullPath,
  },
  sections = {
    lualine_b = {'diagnostics'},
    lualine_c = fullPath,
    lualine_x = { 'lsp_status', 'filetype'},
  },
  extensions = { 'quickfix', 'nvim-tree' },
})
