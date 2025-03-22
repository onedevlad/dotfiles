local on_attach = require("pkg.lsp.handlers").on_attach
local capabilities = require("pkg.lsp.handlers").capabilities

local lspconfig = require("lspconfig")

-- require("lspconfig")["tsserver"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = require("pkg.lsp.settings.tsserver").settings,
-- })

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.jsonls").settings,
  setup = require("pkg.lsp.settings.jsonls").setup,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.lua_ls").settings,
})

lspconfig.hls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.hls").settings,
})

lspconfig.terraformls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("pkg.lsp.settings.terraformls").settings,
})

lspconfig.tflint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
})
