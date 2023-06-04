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
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "nvim-lua/plenary.nvim",
  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  "bkad/CamelCaseMotion",
  "norcalli/nvim-colorizer.lua",
  -- "lukas-reineke/indent-blankline.nvim",
  'dnlhc/glance.nvim',
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-nvim-lsp",
  "jose-elias-alvarez/null-ls.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  "numToStr/Comment.nvim",
  "kevinhwang91/nvim-bqf",

  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/playground"
})
