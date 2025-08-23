return {
    "mini.icons",
    event = "DeferredUIEnter",
    after = function()
        local iconsConfig = require("atelier.config.icons")
        require("mini.icons").setup(iconsConfig)
    end,
}
