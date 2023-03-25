vim.g.nord_disable_background = true
local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
	print("Color scheme not found!")
	return
end
