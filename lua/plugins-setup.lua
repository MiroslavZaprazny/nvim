-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("numToStr/Comment.nvim")
	use("nvim-tree/nvim-tree.lua")

	use("nvim-lualine/lualine.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("kyazdani42/nvim-web-devicons")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")

	use("L3MON4D3/LuaSnip")

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
    use {
       'folke/trouble.nvim',
       requires = 'kyazdani42/nvim-web-devicons'
     }

	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")

    use { "rose-pine/neovim", as = "rose-pine" }

    use("tpope/vim-dadbod")
    use("kristijanhusak/vim-dadbod-ui")

    use("christoomey/vim-tmux-navigator")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
