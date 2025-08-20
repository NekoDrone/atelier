-- enable each lsp here
vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            semantic = {
                enable = false,
            },
            diagnostics = {
                globals = { "vim" },
            },
            hint = {
                enable = true,
                arrayIndex = "Disable",
            },
        },
    },
})
