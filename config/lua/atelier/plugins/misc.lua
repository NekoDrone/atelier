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
        after = function ()
            require("todo-comments").setup()
        end
    }
}
