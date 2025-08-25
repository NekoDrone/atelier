return {
    "refactoring.nvim",
    event = "DeferredUIEnter",
    after = function()
        require("refactoring").setup({})
    end,
}
