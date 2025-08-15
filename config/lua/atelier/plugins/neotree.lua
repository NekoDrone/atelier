return {
    {
        "neo-tree.nvim",
        lazy = false,
        after = function()
            require("lz.n").trigger_load("nui-nvim")
            require("neo-tree").setup({
                popup_border_style = "",
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                    },
                },
		hijack_netrw_behavior = "open_current",
            })
        end,
    },
}
