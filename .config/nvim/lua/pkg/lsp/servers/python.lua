local name = 'python';
vim.lsp.config[name] = {
  cmd = { "pyright" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
  },
  single_file_support = true,
  filetypes = {
    "python",
  },
  init_options = { hostInfo = "neovim" },
  settings = {},
}

vim.lsp.enable(name);
