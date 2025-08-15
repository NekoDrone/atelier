-- leader key
vim.g.mapleader = " "

-- null-ls
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
