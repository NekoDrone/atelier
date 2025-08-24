return {
    "lualine.nvim",
    lazy = false,
    after = function()
        local function format_filename_pretty(str)
            local filetype = vim.bo.filetype
            if filetype == "neo-tree" then
                return "✨ Atelier"
            end

            if filetype == "alpha" then
                return "✨ Welcome to Atelier!"
            end

            return str
        end

        local function format_filename()
            return "atelier"
        end

        local function not_neotree()
            return vim.bo.filetype ~= "neo-tree"
        end

        local function not_alpha()
            return vim.bo.filetype ~= "alpha"
        end

        local function append_atelier(str)
            return str .. " @ atelier"
        end

        -- define our own variant of the catppuccin theme
        -- entirely because i wanted mauve to be normal and blue to be visual
        local lualine_theme = require("catppuccin.utils.lualine")()
        local catppuccin = require("catppuccin.palettes").get_palette()

        lualine_theme.normal.a.bg = catppuccin.mauve
        lualine_theme.normal.b.fg = catppuccin.mauve

        lualine_theme.visual.a.bg = catppuccin.blue
        lualine_theme.visual.b.fg = catppuccin.blue


        require("lualine").setup({
            options = {
                theme = lualine_theme
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        icons_enabled = true,
                        fmt = function(str)
                            local icons = {
                                n = "",
                                i = "",
                                v = "",
                                c = "󰘳",
                                R = "",
                                default = "",
                            }

                            local mode = vim.api.nvim_get_mode().mode
                            return (icons[mode] or icons.default) .. " " .. str
                        end,
                    },
                },
                lualine_b = {
                    {
                        "hostname",
                        cond = not_neotree,
                        fmt = append_atelier,
                    },
                    "branch",
                    {
                        "diff",
                        cond = not_neotree,
                    },
                    {
                        "diagnostics",
                        cond = not_neotree,
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        fmt = format_filename_pretty,
                    },
                },

                lualine_x = {
                    {
                        "location",
                        cond = function()
                            return not_neotree() and not_alpha()
                        end,
                    },
                },
                lualine_y = {
                    {
                        "searchcount",
                        cond = function()
                            return not_neotree() and not_alpha()
                        end,
                    },
                    {
                        "selectioncount",
                        cond = function()
                            return not_neotree() and not_alpha()
                        end,
                    },
                },
                lualine_z = {
                    {
                        "lsp_status",
                        cond = function()
                            return not_neotree() and not_alpha()
                        end,
                    },
                },
            },
            inactive_sections = {
                lualine_c = {
                    "hostname",
                    {
                        "filename",
                        fmt = format_filename,
                    },
                },
                lualine_x = { 'os.date("%I:%M") .. string.lower(os.date("%p"))' },
            },
        })
    end,
}
