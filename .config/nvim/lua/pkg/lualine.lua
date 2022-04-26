require('lualine').setup({
  options = {
    theme = 'powerline_dark',
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_b = {'diagnostics'}
  },
})
