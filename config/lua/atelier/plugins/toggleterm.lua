return {
    "toggleterm.nvim",
    -- event = "VimEnter",
    after = function()
        require("toggleterm").setup()

        function set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><Cmd>Neotree<CR>]], opts)
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
    end,
}
