local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux
local theme_name = 'Dark+'

config.term = "wezterm"
config.font_size = 12
config.color_scheme = theme_name
config.inactive_pane_hsb = { saturation = 0.5, brightness = 0.2 }
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.macos_window_background_blur = 100
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.tab_max_width = 40
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

local bg = '#181818'
local fg = '#9d9d9d'
config.colors = {
  tab_bar = { background = bg },
}
tabline.setup({
  options = {
    theme = theme_name,
    icons_enabled = true,
    tabs_enabled = true,
    process_icons = {
      ['zsh'] = wezterm.nerdfonts.dev_terminal,
    },
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = '',
      right = ' ',
    },
    theme_overrides = {
      normal_mode = {
        x = { fg = fg, bg = bg },
        y = { fg = fg, bg = bg },
      },
      tab = {
        active         = { fg = '#bfbfbf', bg = '#252525' },
        inactive       = { fg = fg, bg = bg },
      },
    },
  },
  sections = {
    tabline_a = {},
    tabline_b = {},
    tabline_c = {},
    tab_active = {
      'index',
      { 'process', padding = { left = 0, right = 1 } },
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = {
      { 'index', padding = { left = 1, right = 0 } },
      ':',
      { 'process', padding = { left = 0, right = 1 } },
    },
    tabline_x = {},
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { { 'workspace', icons_enabled = true } },
  },
  extensions = {},
})

config.enable_csi_u_key_encoding = true

-- Prefix key: M-a (mirrors tmux prefix)
config.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1000 }

config.keys = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- Pane navigation (no prefix): M-C-hjkl
  { key = 'h', mods = 'ALT|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'ALT|CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT|CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'ALT|CTRL', action = act.ActivatePaneDirection 'Right' },

  -- Pane resize (no prefix): M-C-arrows
  { key = 'UpArrow',    mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'DownArrow',  mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'LeftArrow',  mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Right', 1 } },

  -- Split panes (prefix + key), inherits cwd automatically
  { key = '\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = "'",  mods = 'LEADER', action = act.SplitVertical   { domain = 'CurrentPaneDomain' } },

  -- Tab (window) navigation: prefix + h/l
  { key = 'h', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'l', mods = 'LEADER', action = act.ActivateTabRelative(1) },

  -- Workspace (session) navigation: prefix + j/k
  { key = 'j', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
  { key = 'k', mods = 'LEADER', action = act.SwitchWorkspaceRelative(-1) },

  -- New tab: prefix + c
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },

  -- Zoom pane toggle: prefix + z
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

  -- Kill pane without prompt: prefix + x
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false } },

  -- Enter copy mode (vi keys): prefix + [
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

  -- List workspaces
  {
    key = 'w',
    mods = 'LEADER',
    action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  { key = 'n', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'LEADER', action = act.SwitchWorkspaceRelative(-1) },

  -- Rename current workspace
  {
    key = 'r',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name:',
      action = wezterm.action_callback(function(_, _, line)
        if line then
          mux.rename_workspace(mux.get_active_workspace(), line)
        end
      end),
    },
  },
}

return config
