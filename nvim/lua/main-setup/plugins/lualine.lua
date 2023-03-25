local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local nord = require("lualine.themes.nord")

local custom_colors = {
	backgound = "#2e333f",
	red = "#be6069",
}

nord.normal.c.bg = custom_colors.backgound
nord.normal.b.bg = custom_colors.red

-- configure lualine
require("lualine").setup({
	options = {
		theme = nord,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
