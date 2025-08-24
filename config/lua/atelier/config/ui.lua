local catppuccin = require("catppuccin.palettes").get_palette()

vim.api.nvim_set_hl(0, "WinBar", {
    bg = catppuccin.mantle,
})
