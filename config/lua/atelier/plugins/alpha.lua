return {
    "alpha-nvim",
    event = "VimEnter",
    lazy = false,
    after = function()
        local greetingConfig = require("atelier.config.greet")
        local alpha = require("alpha")

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("alpha").start()
            end,
        })

        alpha.setup(greetingConfig)
    end,
}
