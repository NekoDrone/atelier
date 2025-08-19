vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "nix",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
