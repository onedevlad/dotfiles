return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    -- @type wk.Opts
    wk.setup({
      replace = {
        key = {
          { "<space>", "SPC" },
          { "<leader>", "," },
          { "<BS>", "⌫" }
        }
      }
    })

    wk.add({
      { "<leader>t", group = "Test", icon = "🧪" },
      { "<leader>v", group = "Diff View", icon = "⚖️" },
      { "<leader>d", group = "Debug", icon = "🐞" },
    })
  end,
}
