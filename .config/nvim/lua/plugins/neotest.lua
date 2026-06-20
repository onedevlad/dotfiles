return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-jest",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<Leader>tt", function() require("neotest").run.run() end, desc = "Run test" },
    { "<Leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all tests" },
    { "<Leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test" },
    { "<Leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
    { "<Leader>to", function() require("neotest").output.open({ autoClose = true }) end, desc = "Open output" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({}),
      },
    })
  end,
}
