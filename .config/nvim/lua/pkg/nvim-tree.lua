local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- Apply default mappings
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local mappings = {
    ["u"] = { api.tree.change_root_to_parent, "Up" },
    ["l"] = { api.node.open.edit, "Open" },
    ["<CR>"] = { api.node.open.edit, "Open" },
    ["o"] = { api.node.open.edit, "Open" },
    ["h"] = { api.node.navigate.parent_close, "Close Directory" },
    ["s"] = { api.node.open.vertical, "Open: Vertical Split" },
    ["i"] = { api.node.open.horizontal, "Open: Horizontal Split" },
    ["C"] = { api.tree.change_root_to_node, "CD" },
    ["F"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
    ["P"] = { api.fs.paste, "Paste Node" },
    ["p"] = { api.node.navigate.parent, "Focus Parent" },
    ["L"] = { ":bnext<CR>", "Focus Next Buffer" },
  }

  for keys, mapping in pairs(mappings) do
    vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
  end
end

require('nvim-tree').setup({
  on_attach = my_on_attach,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  view = {
    signcolumn = "auto",
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
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    add_trailing = true,
    special_files = {},
  },
})
