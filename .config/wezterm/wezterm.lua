-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'GitHub Dark'
-- config.font = wezterm.font('JetBrains Mono', { weight = "Bold", harfbuzz_features = {"calt=0", "clig=0", "liga=0"} })
config.font = wezterm.font {
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_decorations = "TITLE|RESIZE"
config.window_padding = { 
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}
config.initial_cols = 200
config.initial_rows = 60

-- and finally, return the configuration to wezterm
return config
