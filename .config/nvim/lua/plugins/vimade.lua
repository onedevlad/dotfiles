return {
  "tadaa/vimade", -- dims inactive panes
  config = function()
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
  end,
}
