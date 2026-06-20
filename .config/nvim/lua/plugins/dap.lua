return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "igorlfs/nvim-dap-view",
    "Jorenar/nvim-dap-disasm",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local map = require("utils.keymap")

    require("mason-nvim-dap").setup({
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

    local function locate_bin_executable()
      local candidates = vim.fn.glob(vim.fn.getcwd() .. "/bin/*", false, true)
      candidates = vim.tbl_filter(function(f)
        return vim.fn.executable(f) == 1
      end, candidates)
      if #candidates == 1 then return candidates[1] end
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/", "file")
    end

    local function prompt_args()
      local args_string = vim.fn.input('Args: ')
      return vim.split(args_string, " +")
    end

    local function prompt_bin_path()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end

    -- Configurations
    dap.configurations = {
      c = {
        {
          name = "Launch (bin/)",
          type = "codelldb",
          request = "launch",
          cwd = "${workspaceFolder}",
          program = locate_bin_executable,
          stopOnEntry = stop_on_entry,
          args = prompt_args,
        },
        {
          name = "Launch (pick executable)",
          type = "codelldb",
          request = "launch",
          cwd = "${workspaceFolder}",
          program = prompt_bin_path,
          args = prompt_args,
          stopOnEntry = stop_on_entry,
        },
      },
    }

    dap.configurations.cpp = dap.configurations.c

    -- Breakpoint signs
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

    require("dap-view").setup({
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

    require("dap-disasm").setup({
      dapview_register = true,
      dapview = {
        keymap = "D",
        label = "Disassembly",
        short_label = "󰒓 [D]",
      },
    })

    -- Keymaps
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
  end,
}
