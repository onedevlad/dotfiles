local status_ok, dap_view = pcall(require, "dap-view")
if not status_ok then return end

local status_ok_2, dap_disasm = pcall(require, "dap-disasm")
if not status_ok_2 then return end

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

dap_disasm.setup({
  dapview_register = true,
  dapview = {
    keymap = "D",
    label = "Disassembly",
    short_label = "󰒓 [D]",
  },
})

dap_view.setup({
  winbar = {
    sections = {
      "disassembly",
      "watches",
      "scopes",
      "exceptions",
      "breakpoints",
      "threads",
      "repl",
    },
  },
  windows = {
    size = 0.25,
    position = "below",
    terminal = {
      size = 0.3,
      position = "right",
      -- List of debug adapters for which the terminal should be ALWAYS hidden
      -- Can also be set to "true" to never show the terminal
      hide = {},
    },
  },
  keymaps = {
    hover = {
      quit = "q",
      toggle = { "K", "o", "<CR>", "<2-LeftMouse>" },
      jump_to_parent = "[[",
      set_value = "s",
    },
  },

  virtual_text = {
    enabled = true,
  },
  auto_toggle = true,
})
