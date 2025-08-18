return {
    {
        "lazydev.nvim",
        -- event = "DeferredUIEnter",
        after = function()
            require("lazydev").setup()
        end,
    },
}
