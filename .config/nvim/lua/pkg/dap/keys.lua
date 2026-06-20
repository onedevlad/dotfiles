local dap = require("dap")
local map = require('utils.keymap')

local setCondBreakpoint = function ()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition:"))
end

map("n", "<M-k>",  dap.continue,      { desc = "DAP: Continue" })
map("n", "<M-K>",  dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
map("n", "<M-j>",  dap.step_over,     { desc = "DAP: Step Over" })
map("n", "<M-l>",  dap.step_into,     { desc = "DAP: Step Into" })
map("n", "<M-h>",  dap.step_out,      { desc = "DAP: Step Out" })

map("n", "<Leader>db",  dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
map("n", "<Leader>dB",  setCondBreakpoint,     { desc = "DAP: Conditional Breakpoint" })
map("n", "<Leader>dl",  dap.run_last,          { desc = "DAP: Run Last debug configuration" })
map("n", "<Leader>dt",  dap.terminate,         { desc = "DAP: Terminate" })
map("n", "<Leader>du",  ":DapViewToggle<CR>",  { desc = "DAP: Toggle UI" })
