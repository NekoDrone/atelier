local M = {}

function M.is_buffer_writable(buf_id)
    if not vim.api.nvim_buf_is_valid(buf_id) then
        return false
    end

    if not vim.api.nvim_get_option_value("modifiable", { buf = buf_id }) then
        return false
    end

    if vim.api.nvim_get_option_value("readonly", { buf = buf_id }) then
        return false
    end

    local buf_name = vim.api.nvim_buf_get_name(buf_id)
    if buf_name == "" then
        return false
    end

    local buf_type = vim.api.nvim_get_option_value("buftype", { buf = buf_id })
    if buf_type ~= "" then
        return false
    end

    return true
end

function M.close_buffer_prevent_current(buf_id)
    if buf_id ~= vim.api.nvim_get_current_buf() then
        if M.is_buffer_writable(buf_id) then
            vim.api.nvim_buf_call(buf_id, function()
                vim.cmd("W")
            end)
        end
        vim.api.nvim_buf_delete(buf_id, { force = true })
    end
end

function M.close_buffer_if_writable(buf_id)
    if M.is_buffer_writable(buf_id) then
        vim.api.nvim_buf_call(buf_id, function()
            vim.cmd("W")
        end)
    end
    vim.api.nvim_buf_delete(buf_id, { force = true })
end

return M
