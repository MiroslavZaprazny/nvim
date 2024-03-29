vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>cc", ":noh")
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>?", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>g", "<cmd>:GitBlameToggle<cr>") -- Toggle git blame
keymap.set("n", "<leader>te", "<cmd>:term<cr>") -- Toggle terminal
keymap.set("n", "<leader>c", "<cmd>:let @+=expand('%:p')<cr>") -- Copy path of current buffer filename to clipboard
keymap.set("n", "<C-k>", ":<cmd>TmuxNavigateUp<CR>")
keymap.set("n", "<C-j>", ":<cmd>TmuxNavigateDown<CR>")
keymap.set("n", "<C-l>", ":<cmd>TmuxNavigateRight<CR>")
keymap.set("n", "<C-h>", ":<cmd>TmuxNavigateLeft<CR>")
