return function()
	local null_ls = require("null-ls")

	-- -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	-- local formatting = null_ls.builtins.formatting
	-- -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
	-- local diagnostics = null_ls.builtins.diagnostics
	--
	-- -- Load custom configurations
	-- local exist, custom = pcall(require, "custom")
	-- local sources = exist and type(custom) == "table" and custom.setup_sources and
	--     custom.setup_sources(null_ls.builtins)
	--     or {}

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
		},
	})
end
