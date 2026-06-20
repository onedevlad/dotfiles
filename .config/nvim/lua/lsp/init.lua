vim.lsp.config("*", {
  root_markers = { ".git" },
})

require("lsp.servers.c")
require("lsp.servers.css")
require("lsp.servers.json")
require("lsp.servers.ts")
require("lsp.servers.lua")
require("lsp.servers.python")
require("lsp.servers.terraform")
