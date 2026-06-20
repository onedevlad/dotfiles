return {
  "kevinhwang91/nvim-bqf",
  config = function()
    local map = require("utils.keymap")

    require('bqf').setup({})

    local toggleQuickfix = function ()
      local is_open = false
      for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
          is_open = true
          break
        end
      end
      vim.cmd(is_open and 'cclose' or 'copen')
    end

    vim.api.nvim_create_user_command('Ctoggle', toggleQuickfix, {})

    map("n", "<Leader>q", toggleQuickfix, { desc = "Toggle Quickfix" })
  end,
}
