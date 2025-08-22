return {
    "telescope.nvim",
    event = "DeferredUIEnter",
    after = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        })
    end,
}
