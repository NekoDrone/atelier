return {
    "alpha-nvim",
    lazy = false,
    after = function()
        require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
}
