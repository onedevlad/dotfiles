local bqf = require('bqf')

bqf.setup({})

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
