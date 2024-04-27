local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup({
  ensure_installed = { "js-debug-adapter" },
})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "jsonls" },
})
require("pkg.lsp.lspconfig")
require("pkg.lsp.handlers").setup()
require("pkg.lsp.none-ls")
