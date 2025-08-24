return {
    "fidget.nvim",
    lazy = false,
    after = function()
        require("fidget").setup({
            notification = {
                override_vim_notify = false,
                window = {
                    winblend = 0,
                },
            },
        })
    end,
}
