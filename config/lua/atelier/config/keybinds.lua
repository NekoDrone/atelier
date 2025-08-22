-- leader key
vim.g.mapleader = " "

-- neo-tree
vim.keymap.set("n", "<leader>eq", "<cmd>Neotree action=focus<cr><cmd>Neotree<CR>", {})

-- null-ls
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- gitsigns
-- see plugins/gitsigns.lua

-- telescope
vim.keymap.set("n", "<leader>FF", "<cmd>Neotree<cr><cmd>Telescope find_files<cr>", { noremap = true, desc = "telescope find files" })
vim.keymap.set("n", "<leader>FG", "<cmd>Neotree<cr><cmd>Telescope live_grep<cr>", { noremap = true, desc = "telescope ripgrep search" })
