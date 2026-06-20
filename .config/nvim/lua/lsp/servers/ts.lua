local name = 'ts';
vim.lsp.config[name] = {
  cmd = { "typescript-language-server", "--stdio" },
  single_file_support = true,
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
  },
  init_options = { hostInfo = "neovim" },
  settings = {},
}

vim.lsp.enable(name);
