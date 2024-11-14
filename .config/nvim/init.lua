-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

for _, source in ipairs({
	"plugins",
	"options",
	"keymaps",
	"autocmds",
}) do
	local ok, fault = pcall(require, source)
	if not ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

-- Load custom configurations
local exist, custom = pcall(require, "custom")
if exist and type(custom) == "table" and custom.configs then
	custom.configs()
end
