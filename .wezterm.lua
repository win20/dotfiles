-- Pull in the wezterm API
local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['Ashes (dark) (terminal.sexy)']
local config = wezterm.config_builder()


-- CONFIG --

-- Applications --
config.default_prog = {'C:/Windows/system32/wsl.exe', '--cd', '~/dev'}
config.launch_menu = {
    {
        label = 'Ubuntu',
        args = {'C:/Windows/system32/wsl.exe', '--cd', '~/dev'},
    },
    {
        label = 'Git Bash',
        args = {'C:/Program Files/Git/bin/bash.exe', '-i', '-l'},
        cwd = 'C:/Users/winba/Postman'
    },
    {
        label = 'Bash',
        args = {'bash', '-l'}
    },
}

-- Appearance --
config.audible_bell = 'Disabled'
config.color_scheme = 'Ashes (dark) (terminal.sexy)'
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_padding = {
    left = 5,
    right = 0,
    top = -5,
    bottom = 0,
}
config.colors = {
    tab_bar = {
        background = scheme.background,
        new_tab = { bg_color = scheme.ansi[1], fg_color = scheme.ansi[8], intensity = "Bold" },
        new_tab_hover = { bg_color = scheme.ansi[3], fg_color = scheme.brights[8], intensity = "Bold" },
        active_tab = { bg_color = scheme.ansi[1], fg_color = scheme.ansi[4], intensity = 'Bold' },
        inactive_tab = { bg_color = scheme.ansi[1], fg_color = scheme.ansi[8], intensity = 'Half' },
        inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.ansi[2] },
    }
}

-- Key bindings
config.disable_default_key_bindings = true
config.enable_csi_u_key_encoding = true
config.leader = { key = "Space", mods = "SHIFT" }
config.keys = {
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
        key = 'i',
        mods = 'LEADER',
        action = wezterm.action.MoveTabRelative(-1),
    },
    {
        key = 'o',
        mods = 'LEADER',
        action = wezterm.action.MoveTabRelative(1),
    },
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'q',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'h',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize {'Left', 5},
    },
    {
        key = 'j',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize {'Down', 5},
    },
    {
        key = 'k',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize {'Up', 5},
    },
    {
        key = 'l',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize {'Right', 5},
    },
    { key = "c", mods = "CTRL", action = wezterm.action.CopyTo 'Clipboard' },
	{ key = "v", mods = "CTRL", action =  wezterm.action.PasteFrom 'Clipboard' }
}

return config
