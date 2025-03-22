local plugins = require("plugins.plugins")

require("lazy").setup({
	spec = { plugins },
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	defaults = {
		lazy = false,                                      -- should plugins be lazy-loaded?
		version = nil,
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	install = {
		-- install missing plugins on startup
		missing = true,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		-- get a notification when new updates are found
		-- disable it as it's too annoying
		notify = false,
		-- check for updates every day
		frequency = 86400,
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		-- get a notification when changes are found
		-- disable it as it's too annoying
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
})
