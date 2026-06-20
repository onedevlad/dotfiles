local name = "css";
vim.lsp.config[name] = {
  cmd = { "some-sass-language-server", "--stdio" },
  filetypes = { "css", "sass", "scss" },
  settings = {
  },
}

vim.lsp.enable(name)
