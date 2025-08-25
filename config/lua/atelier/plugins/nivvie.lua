return {
    "nivvie.nvim",
    lazy = false,
    after = function()
        require("nivvie").setup({
            autorestore = false,
            autosave = false,
        })
    end,
}
