require("pkg.lsp.mason")

vim.lsp.config("*", {
  root_markers = { ".git" },
})

require("pkg.lsp.servers.c")
require("pkg.lsp.servers.css")
require("pkg.lsp.servers.json")
require("pkg.lsp.servers.ts")
require("pkg.lsp.servers.lua")
require("pkg.lsp.servers.terraform")
