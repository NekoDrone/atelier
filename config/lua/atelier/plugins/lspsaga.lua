return {
    "lspsaga.nvim",
    event = "LspAttach",
    after = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = false,
            },
            ui = {
                code_action = " ",
            },
            lightbulb = {
                sign = false,
            },
        })
    end,
}
