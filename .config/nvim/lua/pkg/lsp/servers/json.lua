local name = "json";
vim.lsp.config[name] = {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json" },
  settings = {
    json = {
      format = {
        enable = true,
      },
    },
  },
}

vim.lsp.enable(name)
