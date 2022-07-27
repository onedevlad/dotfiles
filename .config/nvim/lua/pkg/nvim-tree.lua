require('nvim-tree').setup({
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  view = {
    mappings = {
      -- custom_only = false,
      list = {
        { key = "u", action = 'dir_up' },
        { key = "C", action = 'cd' },
        { key = "p", action = "parent_node" },
        { key = "P", action = "paste" },
        { key = "i", action = "split" },
        { key = "s", action = "vsplit" },
        { key = "F", action = "toggle_dotfiles" },
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
  renderer = {
    add_trailing = true,
    special_files = {},
  },
})
