vim.cmd [[
  let g:nvim_tree_icons = {
  \ 'git': {
  \   'untracked': "◌",
  \   'ignored': ' ',
  \ },
  \ 'folders': 1,
  \ 'files': 1,
  \ 'folder_arrows': 0,
  \ }
]]
vim.g['nvim_tree_add_trailing'] = 1
vim.g['nvim_tree_special_files'] = {}

vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':NvimTreeToggle<CR>', { noremap = true })

require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "u", action = 'dir_up' },
        { key = "C", action = 'cd' },
        { key = "p", action = "parent_node" },
        { key = "P", action = "paste" },
        { key = "s", action = "vsplit" },
      },
    }
  },
  actions = {
    open_file = {
      resize_window = true
    }
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})