return {
    "gitsigns.nvim",
    event = "DeferredUIEnter",
    after = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "right_align",
                delay = 0,
            },
            current_line_blame_formatter = "<summary> by <author>, <author_time:%R>",
        }
    )
        vim.keymap.set("n", "<leader>GB", gitsigns.toggle_current_line_blame, {})
    end,
}
