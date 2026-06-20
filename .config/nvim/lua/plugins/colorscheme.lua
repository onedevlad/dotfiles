return {
  "lunarvim/darkplus.nvim",
  priority = 1000, -- load before other plugins so colors are available
  lazy = false,
  config = function()
    -- ui.theme sets `colorscheme darkplus` and layers our highlight overrides
    require("ui.theme")
  end,
}
