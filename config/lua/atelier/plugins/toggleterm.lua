return {
    "toggleterm.nvim",
    -- event = "VimEnter",
    after = function()
        require("toggleterm").setup()
    end,
}
