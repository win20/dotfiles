local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = "200",
		})
	end,
})

-- SET FILE SPECIFIC TAB WIDTH --
-- autocmd("Filetype", {
--     pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })
--

-- Set colorcolumn
autocmd("Filetype", {
	pattern = { "python", "rst", "c", "cpp", "javascript", "typescript" },
	command = "set colorcolumn=80",
})
