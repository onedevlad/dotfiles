local name = "clangd";

vim.lsp.config[name] = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
  filetypes = { 'c', 'cpp', 'h', 'hpp' },
  root_dir = vim.fs.root(0, {
    "compile_commands.json",
    "Makefile",
    ".git",
  }),
}

vim.lsp.enable(name);
