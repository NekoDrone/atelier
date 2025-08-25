-- leader key
vim.g.mapleader = " "

-- vim :woozy_face:
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")

-- my commands (see config/commands.lua)
vim.keymap.set("n", "<C-s>", "<cmd>W<CR>")

-- neo-tree
vim.keymap.set("n", "<leader>eq", "<cmd>Neotree action=focus<cr><cmd>Neotree<CR>", {})

-- null-ls
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

-- gitsigns
vim.keymap.set("n", "<leader>GB", "<cmd>Gitsigns toggle_current_line_blame", {})

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
local function set_terminal_keymaps()
    -- TODO: shift to config/keybinds.lua
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><Cmd>ToggleTerm<CR><Cmd>Neotree<CR>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
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

-- dropbar
vim.keymap.set("n", "<Leader>;", "<cmd>lua require('dropbar.api').pick()<CR>", { desc = "Pick symbols in winbar" })
vim.keymap.set(
    "n",
    "[;",
    "<cmd>lua require('dropbar.api').goto_context_start()<CR>",
    { desc = "Go to start of current context" }
)
vim.keymap.set("n", "];", "<cmd>lua require('dropbar.api').select_next_context()<CR>", { desc = "Select next context" })

-- lspsaga
-- TODO: code_action
-- TODO: definition
-- TODO: finder
-- TODO: hover
-- TODO: outline
-- TODO: rename
