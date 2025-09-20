vim.o.relativenumber = true
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.iskeyword:append("_")
vim.o.swapfile = false
vim.o.wrap = false
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.incsearch = true
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.clipboard:append("unnamedplus")

vim.cmd(":hi statusline guibg=NONE")
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>cc", ":noh")
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<C-f>", ":Explore .<CR>")

keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Pick grep_live<cr>")

keymap.set("n", "<leader>te", "<cmd>:term<cr>")
keymap.set("n", "<leader>c", "<cmd>:let @+=expand('%:p')<cr>")

keymap.set("n", "<C-k>", ":<cmd>TmuxNavigateUp<CR>")
keymap.set("n", "<C-j>", ":<cmd>TmuxNavigateDown<CR>")
keymap.set("n", "<C-l>", ":<cmd>TmuxNavigateRight<CR>")
keymap.set("n", "<C-h>", ":<cmd>TmuxNavigateLeft<CR>")

keymap.set("n", "gf", vim.lsp.buf.signature_help)
keymap.set("n", "gD", vim.lsp.buf.declaration)
keymap.set("n", "gR", vim.lsp.buf.references)
keymap.set("n", "gd", vim.lsp.buf.definition)
keymap.set("n", "gi", vim.lsp.buf.implementation)
keymap.set("n", "K", vim.lsp.buf.hover)

vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- TODO try out blink.cmp
vim.keymap.set('i', '<C-f>', '<C-x><C-o>', { desc = 'Omni completion' })
vim.cmd([[
	inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
]])

vim.pack.add({
	{ src = "https://github.com/numToStr/Comment.nvim" },
	-- { src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	-- { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- { src = "nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/AlexvZyl/nordic.nvim" },
})

require "mason".setup()
require "mason-lspconfig".setup({
	automatic_enable = true,
    ensure_installed = 
	{
		"rust_analyzer",
		"clangd",
		"intelephense",
        "gopls",
        "pylsp",
		"elixirls",
	}
})
require "Comment".setup()
require "mini.pick".setup({
    mappings = {
        move_down = '<C-j>',
        move_up = '<C-k>',
  },
})

vim.cmd("colorscheme nordic")

vim.cmd [[set completeopt+=menuone,noselect,popup]]

