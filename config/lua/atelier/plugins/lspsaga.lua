return {
    "lspsaga.nvim",
    event = "LspAttach",
    after = function ()
        local test = {}
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = false,
            }
        })
    end
}
