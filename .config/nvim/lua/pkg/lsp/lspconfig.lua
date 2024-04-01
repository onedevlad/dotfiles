local on_attach = require("pkg.lsp.handlers").on_attach
local capabilities = require("pkg.lsp.handlers").capabilities

require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.tsserver").settings,
})

require("lspconfig")["jsonls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.jsonls").settings,
  setup = require("pkg.lsp.settings.jsonls").setup,
})

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.lua_ls").settings,
})

require("lspconfig")["hls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.hls").settings,
})
