return {
  "williamboman/mason.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "tree-sitter-cli",
        "stylua",
        "lua-language-server",
        "terraform-ls",
        "typescript-language-server",
        "json-lsp",
        "pyright",
        "codelldb",
      },
    })
  end,
}
