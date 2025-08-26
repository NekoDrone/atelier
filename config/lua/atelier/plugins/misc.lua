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
            require("nvim-autopairs").setup({})
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
}
