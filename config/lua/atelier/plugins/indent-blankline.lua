return {
    "indent-blankline.nvim",
    event = "DeferredUIEnter",
    after = function()
        local indent_highlights = {
            "IndentRainbowRed",
            "IndentRainbowYellow",
            "IndentRainbowBlue",
            "IndentRainbowOrange",
            "IndentRainbowGreen",
            "IndentRainbowViolet",
            "IndentRainbowCyan",
        }

        local scope_highlights = {
            "ScopeRainbowRed",
            "ScopeRainbowYellow",
            "ScopeRainbowBlue",
            "ScopeRainbowOrange",
            "ScopeRainbowGreen",
            "ScopeRainbowViolet",
            "ScopeRainbowCyan",
        }

        local hooks = require("ibl.hooks")

        local catppuccin = require("catppuccin.palettes").get_palette()
        local U = require("catppuccin.utils.colors")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IndentRainbowRed", { fg = U.darken(catppuccin.red, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowYellow", { fg = U.darken(catppuccin.yellow, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowBlue", { fg = U.darken(catppuccin.blue, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowOrange", { fg = U.darken(catppuccin.peach, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowGreen", { fg = U.darken(catppuccin.green, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowViolet", { fg = U.darken(catppuccin.mauve, 0.25, catppuccin.base) })
            vim.api.nvim_set_hl(0, "IndentRainbowCyan", { fg = U.darken(catppuccin.teal, 0.25, catppuccin.base) })

            vim.api.nvim_set_hl(0, "ScopeRainbowRed", { fg = catppuccin.red })
            vim.api.nvim_set_hl(0, "ScopeRainbowYellow", { fg = catppuccin.yellow })
            vim.api.nvim_set_hl(0, "ScopeRainbowBlue", { fg = catppuccin.blue })
            vim.api.nvim_set_hl(0, "ScopeRainbowOrange", { fg = catppuccin.peach })
            vim.api.nvim_set_hl(0, "ScopeRainbowGreen", { fg = catppuccin.green })
            vim.api.nvim_set_hl(0, "ScopeRainbowViolet", { fg = catppuccin.mauve })
            vim.api.nvim_set_hl(0, "ScopeRainbowCyan", { fg = catppuccin.teal })
        end)

        vim.g.rainbow_delimiters = { highlight = scope_highlights }
        require("ibl").setup({
            indent = {
                highlight = indent_highlights,
                char = "│",
            },
            scope = {
                enabled = true,
                highlight = scope_highlights,
                show_start = false,
                show_end = false,
                char = "▎",
            },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
