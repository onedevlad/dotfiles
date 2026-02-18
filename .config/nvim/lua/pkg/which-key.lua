local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

-- @type wk.Opts
local config = {
  replace = {
    key = {
      { "<space>", "SPC" },
      { "<leader>", "," },
      { "<BS>", "⌫" }
    }
  }
}

wk.setup(config);

wk.add({
  { "<leader>t", group = "Test", icon = "🧪" },
  { "<leader>v", group = "Diff View", icon = "⚖️" },
})
