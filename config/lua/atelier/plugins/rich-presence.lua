return {
    -- FIXME: borked because discord borked rpc stuff and the version on nixpkgs (2.2.7) doesn't have the fix (2.3.3 does)
    "cord.nvim",
    event = "VimEnter",
    after = function()
        require("cord").setup({
            editor = {
                tooltip = "Atelier, the Weaver's Abode",
            },
            display = {
                theme = "catppuccin",
                flavor = "accent",
                swap_icons = true,
            },
        })
    end,
}
