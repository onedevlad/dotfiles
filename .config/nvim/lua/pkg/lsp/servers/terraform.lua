local name = "terraform";
vim.lsp.config[name] = {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform" },
  root_markers = { ".terraform" },
  settings = {
    experimentalFeatures = {
      prefillRequiredFields = true,
    },
  },
}

vim.lsp.enable(name);
