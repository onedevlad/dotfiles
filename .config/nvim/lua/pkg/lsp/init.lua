local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("pkg.lsp.lsp-installer")
require("pkg.lsp.handlers").setup()
require("pkg.lsp.null-ls")
