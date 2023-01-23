vim.cmd("colorscheme rasmus")
local status, _ = pcall(vim.cmd, "colorscheme rasmus")

if not status then
	print("Colorscheme not found")
	return
end
