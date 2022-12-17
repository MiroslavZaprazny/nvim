vim.cmd("colorscheme nordfox")
--https://github.com/EdenEast/nightfox.nvim

local status, _ = pcall(vim.cmd, "colorscheme nordfox")

if not status then
	print("Colorscheme not found")
	return
end

