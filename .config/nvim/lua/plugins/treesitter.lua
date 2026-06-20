return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    -- Parsers to install. `tsx` covers `.tsx`; `.jsx` uses the `javascript`
    -- parser (see the filetype -> language mapping baked into Neovim).
    local parsers = {
      "c",
      "cpp",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "terraform",
      "hcl",
    }

    -- Filetypes to enable highlighting for. React filetypes (typescriptreact ->
    -- tsx, javascriptreact -> javascript) resolve to the parsers above.
    local filetypes = {
      "c",
      "cpp",
      "lua",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "terraform",
      "hcl",
    }

    -- Install parsers for the languages we care about (no-op if already present).
    require("nvim-treesitter").install(parsers)

    -- On the `main` branch highlighting/indent are driven by Neovim natively
    -- rather than through a plugin `setup{}` call: start treesitter per buffer.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        -- Guarded: parsers install asynchronously, so a buffer may open before
        -- its parser is ready on first run.
        pcall(vim.treesitter.start)
      end,
    })

    require("ts_context_commentstring").setup {
      enable_autocmd = false,
      languages = {
        typescript = "// %s",
        lua = "-- %s",
      },
    }
  end,
}
