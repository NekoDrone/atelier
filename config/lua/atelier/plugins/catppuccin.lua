return {
    {
        "catppuccin-nvim",
        lazy = false,
        priority = 1000,
        after = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    dark = "mocha",
                },
                transparent_backgrond = false,
                styles = {
                    comments = { "italic" },
                    conditionals = {},
                },
                float = {
                    solid = true,
                },
                term_colors = true,
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
