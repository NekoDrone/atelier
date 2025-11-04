return {
    "blink.cmp",
    lazy = false,
    after = function()
        require("blink.cmp").setup({
            keymap = {
                ["<Tab>"] = { "accept", "fallback" },
                ["<S-Tab>"] = { "select_next", "fallback" },
            },
            completion = {
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            label = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                                ellipsis = true,
                                width = { fill = true, max = 20 },
                            },
                            label_description = {
                                width = { fill = true, max = 40 },
                                text = function(ctx)
                                    return ctx.label_description
                                end,
                                highlight = "BlinkCmpLabelDescription",
                            },
                            kind = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                                text = function(ctx)
                                    return "<" .. ctx.kind .. ">"
                                end,
                            },
                        },
                        columns = {
                            {
                                "kind_icon",
                                "label",
                                gap = 1,
                            },
                            {
                                "label_description",
                                "kind",
                            },
                        },
                    },
                    border = "rounded",
                },
                accept = {
                    auto_brackets = { enabled = true },
                },
            },
            sources = {
                providers = {
                    buffer = {
                        opts = {
                            get_bufnrs = function()
                                return vim.tbl_filter(function(bufnr)
                                    return vim.bo[bufnr].buftype == ""
                                end, vim.api.nvim_list_bufs())
                            end,
                        },
                    },
                },
            },
            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = true } },
            },
        })
    end,
}
