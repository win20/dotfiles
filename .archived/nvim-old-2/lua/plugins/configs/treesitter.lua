return function()
	local config = require("nvim-treesitter.configs")
	config.setup({
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = { "go", "lua" },
	})
end
