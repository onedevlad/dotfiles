local dap = require("dap")

local map = function(key, fn, desc)
	vim.keymap.set("n", key, fn, { desc = desc })
end

local setCondBreakpoint = function ()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition:"))
end

map("<M-k>",  dap.continue,      "DAP: Continue")
map("<M-K>",  dap.run_to_cursor, "DAP: Run to Cursor")
map("<M-j>",  dap.step_over,  "DAP: Step Over")
map("<M-l>",  dap.step_into,  "DAP: Step Into")
map("<M-h>",  dap.step_out,   "DAP: Step Out")

map("<Leader>db",  dap.toggle_breakpoint, "DAP: Toggle Breakpoint")
map("<Leader>dB",  setCondBreakpoint,     "DAP: Conditional Breakpoint")
map("<Leader>dl",  dap.run_last,          "DAP: Run Last debug configuration")
map("<Leader>dt",  dap.terminate,         "DAP: Terminate")
map("<Leader>du",  ":DapViewToggle<CR>",  "DAP: Toggle UI")
