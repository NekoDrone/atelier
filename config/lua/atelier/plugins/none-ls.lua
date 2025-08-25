return {
    "none-ls.nvim",
    event = "DeferredUIEnter",
    priority = 1000,
    after = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.nixfmt,
                null_ls.builtins.formatting.prettierd,
            },
        })
    end,
}
