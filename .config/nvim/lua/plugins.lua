-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI
  "lunarvim/darkplus.nvim",
  "tadaa/vimade",
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "joeytwiddle/sexy_scroller.vim",
  "akinsho/bufferline.nvim",
  "norcalli/nvim-colorizer.lua",
  "maan2003/lsp_lines.nvim",
  "lewis6991/gitsigns.nvim",

  -- Editing
  "bkad/CamelCaseMotion",
  require("pkg.flash"),
  "kevinhwang91/nvim-bqf",
  "echasnovski/mini.ai",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" }
  },

  -- LSP
  "williamboman/mason.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Utilities
  "dnlhc/glance.nvim",
  "kyazdani42/nvim-tree.lua",
  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-jest",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
  "nvim-lua/plenary.nvim",
  "vijaymarupudi/nvim-fzf",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/playground",
})
