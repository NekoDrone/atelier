return {
    "dropbar.nvim",
    event = "DeferredUIEnter",
    after = function()
        local dropbar_api = require("dropbar.api")
    end,
}
