local opts = { noremap = true, silent = true }

local function mapkey(modes, lhs, rhs, custom_opts)
  local merged_opts = vim.tbl_extend("force", opts, custom_opts or {})
  vim.keymap.set(modes, lhs, rhs, merged_opts)
end

return mapkey
