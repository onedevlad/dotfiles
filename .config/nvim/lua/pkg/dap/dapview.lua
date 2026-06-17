local status_ok, dap_view = pcall(require, "dap-view")
  if not status_ok then return
end

local status_ok_2, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
  if not status_ok_2 then return
end

vim.fn.sign_define('DapBreakpoint',
  {
    text = '⚪',
    texthl = 'DapBreakpointSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })

vim.fn.sign_define('DapStopped',
  {
    text = '🔴',
    texthl = 'yellow',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })
vim.fn.sign_define('DapBreakpointRejected',
  {
    text = '⭕',
    texthl = 'DapStoppedSymbol',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
  })

--[[ dap_virtual_text.setup() ]]

dap_view.setup({
  virtual_text = {
    enabled = true
  }
})
