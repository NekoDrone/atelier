-- this file contains sane defaults that ideally shouldn't be touched.
-- if a config is meant to be edited, it should be split to its own file.
return {
    {
        "rainbow-delimiters.nvim",
        event = "DeferredUIEnter",
    },
    {
        "nvim-autopairs",
        event = "DeferredUIEnter",
        after = function()
            require("nvim-autopairs").setup({
                map_cr = true,
            })
        end,
    },
    {
        "beacon.nvim",
        event = "DeferredUIEnter",
        after = function()
            require("beacon").setup({
                enabled = true,
                winblend = 60,
                width = 30,
                min_jump = 1, -- guarantees that we get the beacon every jump
            })
        end,
    },
    {
        "trouble.nvim",
        event = "LspAttach",
        after = function()
            require("trouble").setup()
        end,
    },
    {
        "todo-comments.nvim",
        event = "DeferredUIEnter",
        after = function()
            require("todo-comments").setup()
        end,
    },
    {
        "render-markdown.nvim",
        enabled = false,
        event = "DeferredUIEnter",
        after = function()
            require("render-markdown").setup({
                completions = { lsp = { enabled = true } },
            })
        end,
    },
    {
        "nvim-colorizer.lua",
        event = "DeferredUIEnter",
        after = function()
            require("colorizer").setup({
                user_default_options = {
                    names = true,
                    RGB = true,
                    RGBA = true,
                    RRGGBB = true,
                    RRGGBBAA = true,
                    AARRGGBB = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css_fn = true,
                    tailwind = "both",
                    tailwind_opts = {
                        update_names = true,
                    },
                    sass = {
                        enable = true,
                        parsers = {
                            "css",
                        },
                    },
                    xterm = true,
                },
            })
            require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
            require("colorizer").detach_from_buffer(0, { mode = "virtualtext", css = true })
        end,
    },
    {
        "markview.nvim",
        lazy = false,
        after = function()
            local p = require("markview.presets")

            require("markview").setup({
                -- allows us to use hybrid mode
                preview = {
                    modes = { "n", "i", "no", "c" },
                    hybrid_modes = { "i" },
                    callbacks = {
                        on_enable = function(_, win)
                            vim.wo[win].conceallevel = 2
                            vim.wo[win].concealcursor = "nc"
                        end,
                    },
                },

                markdown = {
                    headings = p.headings.glow,
                    checkboxes = p.checkboxes.nerd,
                    horizontal_rules = p.horizontal_rules.thin,
                    code_blocks = {
                        pad_amount = 2,
                    },
                    list_items = {
                        marker_minus = { add_padding = false },
                        marker_plus = { add_padding = false },
                        marker_star = { add_padding = false },
                        marker_dot = { add_padding = false },
                    },
                    preview = {
                        icon_provider = "mini",
                    },
                },
            })
        end,
    },
}
