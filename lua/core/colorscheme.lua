vim.cmd("colorscheme catppuccin")
--https://github.com/EdenEast/nightfox.nvim

local status, _ = pcall(vim.cmd, "colorscheme catppuccin")

if not status then
	print("Colorscheme not found")
	return
end

