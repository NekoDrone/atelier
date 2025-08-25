return {
    "bufferline.nvim",
    lazy = false,
    after = function()
        local function close_handler(buf_id)
            if buf_id ~= vim.api.nvim_get_current_buf() then
                vim.api.nvim_buf_call(buf_id, function()
                    vim.cmd("W")
                end)
                vim.api.nvim_buf_delete(buf_id, { force = true })
            end
        end

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
