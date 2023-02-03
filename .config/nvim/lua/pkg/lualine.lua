require('lualine').setup({
  options = {
    theme = 'powerline_dark',
    always_divide_middle = false,
    globalstatus = false,
    disabled_filetypes = { 'NvimTree' },
  },
  sections = {
    lualine_b = {'diagnostics'},
    lualine_c = { { 'filename', path = 1 } },
  },
  extensions = { 'quickfix' },
})
