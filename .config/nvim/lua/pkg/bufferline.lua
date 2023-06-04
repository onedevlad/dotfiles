local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then return
end

local c = require('darkplus.palette')
local bg = "#2d2d2d";
local red = "#f88070";

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      style = "icon",
      icon = "▎",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = {{ filetype = "NvimTree", text = "", padding = 1 }},
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    fill = { bg = c.bg }, -- tabbar background

    background = { fg = c.gray, bg = bg }, -- inactive buffer
    buffer_visible = { fg = c.gray, bg = bg }, -- visible buffer
    buffer_selected = { fg = c.fg, bg = c.bg }, -- active buffer

    modified = { fg = red, bg = bg }, -- modified indicator
    modified_selected = { fg = red, bg = c.bg },

    indicator_selected = { fg = c.hint },
    indicator_visible = { bg = bg },
  },
}

