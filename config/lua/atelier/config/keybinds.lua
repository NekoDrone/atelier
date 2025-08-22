-- leader key
vim.g.mapleader = " "

-- neo-tree
vim.keymap.set("n", "<leader>eq", "<cmd>Neotree action=focus<cr><cmd>Neotree<CR>", {})

-- null-ls
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- gitsigns
-- see plugins/gitsigns.lua
