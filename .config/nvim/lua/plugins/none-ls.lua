return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  -- config intentionally left empty; sources are currently commented out
  -- config = function()
  --   local null_ls = require("null-ls")
  --   null_ls.setup({
  --     sources = {
  --       null_ls.builtins.formatting.stylua,
  --       null_ls.builtins.completion.spell,
  --       null_ls.builtins.diagnostics.eslint_d,
  --     },
  --   })
  -- end,
}
