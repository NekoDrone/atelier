return {
    "mini.icons",
    lazy = false,
    after = function()
        require("mini.icons").setup({
            extension = {
                less = {
                    glyph = "",
                },
            },
        })
    end,
}
