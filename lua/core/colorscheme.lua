vim.cmd("colorscheme candle-grey")
local status, _ = pcall(vim.cmd, "colorscheme candle-grey")

if not status then
	print("Colorscheme not found")
	return
end
