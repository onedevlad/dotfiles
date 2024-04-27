local dap = require("dap")
local dapui = require("dapui")

local uiOpts = {
  expand_lines = false,
  layouts = {{
    elements = {
      { id = "breakpoints", size = 0.33 },
      { id = "scopes", size = 0.33 },
      { id = "stack", size = 0.33 }
    },
    position = "right",
    size = 60
  },
  {
    elements = { { id = "repl", size = 1 } },
    position = "bottom",
    size = 15
  }
}}

dapui.setup(uiOpts)

local function dapuiOpen()
  vim.cmd("NvimTreeClose")
  dapui.open({})
end

local function dapuiClose()
  vim.cmd("NvimTreeOpen")
  require('dap.repl').close()
  dapui.close({})
end

dap.listeners.after.event_initialized["dapui_config"] = dapuiOpen
dap.listeners.before.event_terminated["dapui_config"] = dapuiClose
dap.listeners.before.event_exited["dapui_config"] = dapuiClose

local jsLangs = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }

local function openDebugger()
  if vim.fn.filereadable(".vscode/launch.json") then
    local dap_vscode = require("dap.ext.vscode")
    dap_vscode.load_launchjs(nil, { ["pwa-node"] = jsLangs, ["chrome"] = jsLangs, ["pwa-chrome"] = jsLangs })
  end
  vim.cmd("NvimTreeClose")
  require("dap").continue()
end

vim.keymap.set('n', '<Leader>da', openDebugger)
vim.keymap.set('n', '<Leader>do', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dq', function() require('dap').close() end)
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle({}) end)
vim.keymap.set('v', '<Leader>de', function() require('dapui').eval() end)
vim.keymap.set('n', '<Leader>dw', function() require("dap.ui.widgets").hover() end)

require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
})

for _, language in ipairs(jsLangs) do
  if not dap.configurations[language] then
    dap.configurations[language] = {
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Node @ 127.0.0.1:9229',
        address = '127.0.0.1',
        port = 9229,
        cwd = '${workspaceFolder}',
        restart = true,
        skipFiles = { "<node_internals>/**", "node_modules/**" },
        localRoot = vim.fn.getcwd(),
      },
      -- Divider for the launch.json derived configs
      {
        name = "----- ↓ launch.json configs ↓ -----",
        type = "",
        request = "launch",
      },
    }
  end
end
