local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then return
end

local c = require('ui.colors')

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 24,
    max_prefix_length = 24,
    tab_size = 16,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = {{
      filetype = "NvimTree",
      highlight = "NvimTreeNormal",
      text = "",
      padding = 1,
    }},
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = 'slant',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    fill = { bg = c.alt_bg }, -- global background

    background = { fg = c.light_white, bg = c.alt_bg }, -- inactive buffer
    buffer_visible = { fg = c.light_white, bg = c.alt_bg }, -- visible buffer
    buffer_selected = { fg = c.white, bg = c.bg, bold = false }, -- active buffer

    separator = { fg = c.alt_bg },
    separator_selected = { fg = c.alt_bg },
    separator_visible = { bg = c.alt_bg, fg = c.alt_bg },
    trunc_marker = { bg = c.alt_bg, fg = c.light_white },
    
  },
}

