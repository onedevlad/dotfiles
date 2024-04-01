local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("none-ls.code_actions.eslint"),
  },
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
