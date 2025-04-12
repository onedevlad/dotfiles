local colors = require('darkplus.palette')

local overrides = {
  white = "#ffffff",
  light_white = "#9d9d9d",
  black = "#02040a",
  bg = "#1f1f1f",
  none = "none",
  nav_cursorline = '#38373c',
};

for k, v in pairs(overrides) do colors[k] = v end

return colors;
