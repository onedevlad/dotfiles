local function isMac()
  return vim.fn.has("macunix") == 1
end

return {
  isMac = isMac,
}
