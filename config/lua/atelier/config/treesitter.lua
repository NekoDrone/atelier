-- add treesitter file types here
-- don't forget to install the grammar in the default.nix file!
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "nix",
        "vim",
        "bash",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
