require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "stylua",
    "lua-language-server",
    "terraform-ls",
    "typescript-language-server",
  },
})
