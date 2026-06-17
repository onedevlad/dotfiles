local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
require("pkg.dap.keys")
require("pkg.dap.dapview")

mason_dap.setup({
	ensure_installed = { "codelldb", "node2" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

-- Stop on entry when there're no explicit breakpoints defined
local function stop_on_entry()
  local bp = require("dap.breakpoints").get()
  for _, v in pairs(bp) do
    if #v > 0 then return false end
  end
  return true
end

-- Configurations
dap.configurations = {
  c = {
    {
      name = "Launch (bin/)",
      type = "codelldb",
      request = "launch",
      program = function()
        local candidates = vim.fn.glob(vim.fn.getcwd() .. "/bin/*", false, true)
        candidates = vim.tbl_filter(function(f)
          return vim.fn.executable(f) == 1
        end, candidates)
        if #candidates == 1 then return candidates[1] end
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = stop_on_entry,
    },
    {
      name = "Launch (pick executable)",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = stop_on_entry,
    },
  },
}
dap.configurations.cpp = dap.configurations.c
