return {
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
                booleans = { "italic" },
                types = { "italic" },
                keywords = { "italic" },
            },
            float = {
                solid = false,
                transparent = true,
            },
            term_colors = true,
            custom_highlights = function(colors)
                return {
                    ["@property.lua"] = { fg = colors.peach },
                    ["@variable.lua"] = { fg = colors.peach },
                    ["@boolean.lua"] = { fg = colors.blue },
                    ["@number.lua"] = { fg = colors.blue },
                    ["@variable.member.lua"] = { fg = colors.blue },
                    LspInlayHint = { bg = colors.base, fg = colors.overlay0, italic = true },
                }
            end,
            integrations = {
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "underdotted" },
                        warnings = { "undercurl" },
                        information = { "underdotted" },
                    },
                },
                telescope = {
                    enabled = false,
                },
                beacon = true,
            },
        })
    end,
}
