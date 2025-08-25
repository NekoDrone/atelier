return {
    "nivvie.nvim",
    lazy = false,
    after = function ()
        require("nivvie").setup({
            autorestore = false,
            autosave = true,
        })
    end
}
