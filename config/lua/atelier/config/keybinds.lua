-- leader key
vim.g.mapleader = " "

-- vim :woozy_face:
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")

-- my commands (see config/commands.lua)
vim.keymap.set("n", "<leader>S", "<cmd>W<CR>")

-- neo-tree
vim.keymap.set("n", "<leader>eq", "<cmd>Neotree action=focus<cr><cmd>Neotree<CR>", {})

-- null-ls
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- gitsigns
vim.keymap.set("n", "<leader>GB", "<cmd>Gitsigns toggle_current_line_blame<CR>", {})

-- telescope
vim.keymap.set(
    "n",
    "<leader>FF",
    "<cmd>Neotree<cr><cmd>Telescope find_files<cr>",
    { noremap = true, desc = "telescope find files" }
)
vim.keymap.set(
    "n",
    "<leader>/",
    "<cmd>Neotree<cr><cmd>Telescope find_files<cr>",
    { noremap = true, desc = "telescope find files alt" }
)
vim.keymap.set(
    "n",
    "<leader>FG",
    "<cmd>Neotree<cr><cmd>Telescope live_grep<cr>",
    { noremap = true, desc = "telescope ripgrep search" }
)

-- toggleterm
-- keybinds in terminal
local function set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><Cmd>ToggleTerm<CR><Cmd>Neotree<CR>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-`>", [[<C-\><C-n><Cmd>ToggleTerm<CR><Cmd>Neotree<CR>]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function()
        set_terminal_keymaps()
    end,
})

vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*",
    command = "Neotree",
})

vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm<cr>", { desc = "toggle term (wow)" })

-- dropbar
vim.keymap.set("n", "<Leader>;", "<cmd>lua require('dropbar.api').pick()<CR>", { desc = "Pick symbols in winbar" })
vim.keymap.set(
    "n",
    "[;",
    "<cmd>lua require('dropbar.api').goto_context_start()<CR>",
    { desc = "Go to start of current context" }
)
vim.keymap.set("n", "];", "<cmd>lua require('dropbar.api').select_next_context()<CR>", { desc = "Select next context" })

-- bufferline
function Keymap_close_curr_buf()
    require("atelier.lib.close_file").close_buffer_if_writable(0)
end

vim.keymap.set("n", "<C-q>", "<cmd>lua Keymap_close_curr_buf()<CR>", { desc = "close current buffer", noremap = true })

-- refactoring
-- TODO: actually we should just build a UI

-- lspsaga
vim.keymap.set("n", "<C-.>", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<C-l><C-d>", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "<C-l><C-f>", "<cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "<leader>i", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<C-l><C-o>", "<cmd>Lspsaga outline<CR>")
vim.keymap.set("n", "<C-l><C-r>", "<cmd>Lspsaga rename<CR>")

-- trouble.nvim
vim.keymap.set(
    "n",
    "<leader>K",
    "<cmd>Trouble diagnostics toggle<cr>",
    { desc = "find (K)lashes (Trouble diagnostics toggle)" }
)
-- TODO: toggle buffer diagnostics
-- TODO: symbols
-- TODO: basically the relevant configs in github.com/folke/trouble.nvim

-- nivvie
vim.keymap.set("n", "<C-s><C-r>", "<cmd>Nivvie restore<cr><cmd>Neotree<cr>", { desc = "restore nivvie session" })
vim.keymap.set(
    "n",
    "<leader>SQ",
    "<cmd>Neotree close<cr><cmd>WA<cr><cmd>Nivvie save<cr><cmd>qall<cr>",
    { desc = "save nivvie session and and write all" }
)
