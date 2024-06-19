local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "wbthomason/packer.nvim",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "lunarvim/darkplus.nvim",
  "joeytwiddle/sexy_scroller.vim",
  "easymotion/vim-easymotion",
  "vijaymarupudi/nvim-fzf",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "lewis6991/gitsigns.nvim",
  "nvim-lua/plenary.nvim",
  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  "bkad/CamelCaseMotion",
  "norcalli/nvim-colorizer.lua",
  'dnlhc/glance.nvim',
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-nvim-lsp",
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  "nvim-neotest/neotest-jest",
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
  },
  {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  "mxsdev/nvim-dap-vscode-js",
  "rcarriga/cmp-dap",
  "theHamsta/nvim-dap-virtual-text",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "numToStr/Comment.nvim",
  "kevinhwang91/nvim-bqf",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/playground",
})
