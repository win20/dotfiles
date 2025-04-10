return function()
	require("oil").setup({
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, bufnr)
				return vim.startswith(name, "..")
			end,
		},
		keymaps = {
			["q"] = "actions.close",
		},
	})
end
