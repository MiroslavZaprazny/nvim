vim.o.relativenumber = true
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
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
vim.opt.colorcolumn = "120"

vim.cmd(":hi statusline guibg=NONE")
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>cc", ":noh<CR>")
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<C-f>", ":Oil<CR>")

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
keymap.set("n", "<leader>h", vim.lsp.buf.code_action)
keymap.set("n", "<leader>r", vim.lsp.buf.rename)

vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist)

vim.pack.add({
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/saghen/blink.cmp",  version = 'v1.7.0' },
    { src = "https://github.com/akinsho/git-conflict.nvim" },
    { src = "https://github.com/AlexvZyl/nordic.nvim" },
    { src = "https://github.com/tpope/vim-dadbod" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-ui" }
})

local lsp_servers = {
	"rust_analyzer",
	"clangd",
	"gopls",
	"pylsp",
	"elixirls",
    "ts_ls",
}

require "blink.cmp".setup({
	completion = {
		trigger = {
		  show_on_insert_on_trigger_character = false,
		  show_on_keyword = false,
		  show_on_trigger_character = false,
		},
		menu = {
			min_width = 60,
			max_height = 30,
		},
	},
    signature = { enabled = true },
	keymap = {
		preset = 'default',
		['<C-f>'] = { 'show' },
		['<C-j>'] = { 'select_next', 'fallback' },
		['<C-k>'] = { 'select_prev', 'fallback' },
		['<C-e>'] = { 'hide' },
		['<CR>'] = { 'accept', 'fallback' },
	  },
})
require "oil".setup()
require "mason".setup()
require "mason-lspconfig".setup({
	automatic_enable = true,
    ensure_installed = lsp_servers
})
require "Comment".setup()
require('mini.icons').setup()
require "mini.pick".setup({
    mappings = {
        move_down = '<C-j>',
        move_up = '<C-k>',
  },
  options = {
    show_icons = false,
  },
})

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = '#3c3f5a', fg = '#ffffff', bold = true })
  end,
})

require "git-conflict".setup()

vim.cmd("colorscheme nordic")

vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.lsp.config['phpantom'] = {
  cmd = { 'phpantom_lsp' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
}
vim.lsp.enable('phpantom')

require'nvim-treesitter'.install { 'rust', 'javascript', 'zig', "typescript", "php", "python", "go" }
