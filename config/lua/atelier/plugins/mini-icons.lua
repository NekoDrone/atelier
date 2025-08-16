return {
    "mini.icons",
    lazy = false,
    after = function()
        local iconsConfig = require("atelier.config.icons")
        require("mini.icons").setup(iconsConfig)
    end,
}
