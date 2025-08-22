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

        local catppuccin = require("catppuccin.palettes").get_palette()

        -- alternate cursor specifically on Alpha
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.api.nvim_set_hl(0, "Cursor", { bg = catppuccin.mauve })
                vim.opt.guicursor = "a:hor1-Cursor"
            end,
        })

        -- restore after leaving
        vim.api.nvim_create_autocmd("BufLeave", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype == "alpha" then
                    vim.api.nvim_set_hl(0, "Cursor", { bg = catppuccin.yellow })
                    vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50-Cursor"
                end
            end,
        })
    end,
}
