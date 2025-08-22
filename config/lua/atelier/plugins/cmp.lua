return {
    "blink.cmp",
    event = "DeferredUIEnter",
    after = function()
        require("blink.cmp").setup({
            keymap = {
                ["<Tab>"] = { "accept", "fallback" },
                ["<S-Tab>"] = { "select_next", "fallback" },
                ["<CR>"] = { "accept_and_enter", "fallback" },
            },
        })
    end,
}
