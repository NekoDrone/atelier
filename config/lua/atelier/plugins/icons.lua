return {
    "mini.icons",
    lazy = false,
    after = function()
        require("mini.icons").setup({
            -- extension = {
            --     lua = {
            --         glyph = "",
            --     },
            -- },
        })
    end,
}
