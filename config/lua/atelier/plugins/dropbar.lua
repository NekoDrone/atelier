return {
    "dropbar.nvim",
    event = "DeferredUIEnter",
    after = function()
        local dropbar_api = require("dropbar.api")

        -- TODO: move these to config/keymaps.lua
        vim.keymap.set("n", "<Leader>;", "<cmd>lua require('dropbar.api').pick()<CR>", { desc = "Pick symbols in winbar" })
        vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
        vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
}
