-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", vim.lsp.buf.signature_help) -- show definition, references
	keymap.set("n", "gD", vim.lsp.buf.declaration) -- got to declaration
	keymap.set("n", "gR", vim.lsp.buf.references) -- see references
	keymap.set("n", "gd", vim.lsp.buf.definition) -- see definition and make edits in window
	keymap.set("n", "gi", vim.lsp.buf.implementation) -- go to implementation
	keymap.set("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set('n', '<leader>D', '<cmd>Trouble diagnostics toggle<cr>', opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["intelephense"].setup({
    filetypes = { "php" },
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
