vim.cmd("colorscheme fogbell")
local status, _ = pcall(vim.cmd, "colorscheme fogbell")

if not status then
	print("Colorscheme not found")
	return
end
