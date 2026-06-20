local map = require("utils.keymap")

-- Compile via `:make <target>` without the hit-enter prompt. Only errors are
-- kept in the quickfix list (warnings are ignored); a one-line summary of the
-- outcome is echoed to the cmdline. bqf's float shows surrounding code on hover.
local compile = function (target)
  return function ()
    vim.cmd("write")
    vim.cmd("silent make " .. target)

    local errors, warnings = {}, {}
    for _, item in ipairs(vim.fn.getqflist()) do
      if item.valid == 1 then
        local kind = (item.type or ""):upper()
        if kind == "W" or item.text:match("^%s*[Ww]arning:") then
          table.insert(warnings, item)
        elseif kind == "E" or item.text:match("^%s*[Ee]rror:") then
          table.insert(errors, item)
        end
      end
    end

    vim.fn.setqflist({}, "r", { items = errors, title = ":make " .. target })
    vim.cmd("redraw")
    vim.cmd(#errors > 0 and "copen" or "cclose")

    local function plural(n) return n == 1 and "" or "s" end
    local msg, hl
    if #errors > 0 then
      msg = string.format("✗ make %s — %d error%s", target, #errors, plural(#errors))
      if #warnings > 0 then
        msg = msg .. string.format(", %d warning%s", #warnings, plural(#warnings))
      end
      hl = "ErrorMsg"
    elseif #warnings > 0 then
      msg = string.format("⚠ make %s — compiled with %d warning%s", target, #warnings, plural(#warnings))
      hl = "WarningMsg"
    else
      msg = string.format("✓ make %s — compiled successfully", target)
      hl = "DiagnosticOk"
    end
    vim.api.nvim_echo({ { msg, hl } }, true, {})
  end
end

map("n", "<Leader>dmr", compile("release"), { desc = "Make Release" })
map("n", "<Leader>dmd", compile("debug"),   { desc = "Make Debug" })
