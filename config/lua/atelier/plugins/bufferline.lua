return {
    "bufferline.nvim",
    lazy = false,
    after = function()
        local close_handler = require("atelier.lib.close_file").close_buffer_prevent_current

        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Atelier",
                        text_align = "center",
                    },
                },
                custom_filter = function(buf_number)
                    local buf_name = vim.fn.bufname(buf_number)
                    if buf_name == "" then
                        return false
                    end
                    return true
                end,
                right_mouse_command = close_handler,
                close_command = close_handler,
            },
        })
    end,
}
