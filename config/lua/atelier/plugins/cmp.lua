return {
    "blink.cmp",
    event = "DeferredUIEnter",
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
                            kind = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                                text = function(ctx)
                                    return "<" .. ctx.kind .. ">"
                                end,
                            },
                            label = {
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            source_name = {
                                text = function(ctx)
                                    return "[" .. ctx.source_name .. "]"
                                end,
                                highlight = "BlinkCmpSource",
                            },
                        },
                        columns = {
                            {
                                "kind_icon",
                                "label",
                                "label_description",
                                gap = 1,
                            },
                            {
                                "kind",
                                "source_name",
                                gap = 1,
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
