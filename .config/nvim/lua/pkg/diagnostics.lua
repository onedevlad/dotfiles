local lsp_lines = require("lsp_lines")
lsp_lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = {
    text= {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    }
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    source = true,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gj", ":lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
vim.keymap.set("n", "gk", ":lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
vim.keymap.set("n", "<Leader>l", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
vim.keymap.set("n", "<Leader>k", vim.lsp.buf.format, { desc = "Format buffer" })
