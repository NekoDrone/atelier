local close_file = require("atelier.lib.close_file")
local fidget = require("fidget")

-- fancier :w command
vim.api.nvim_create_user_command("W", function()
    vim.lsp.buf.format()
    vim.cmd("silent write")
    local project_dir = vim.fn.getcwd()
    local curr_file = vim.fn.expand("%:p")

    local display = curr_file:gsub("^" .. vim.pesc(project_dir) .. "/", "@/")
    fidget.notify(display, vim.log.levels.INFO, { annote = "saved file" })
end, { desc = "fancier :w command" })

-- fancier :wa command
vim.api.nvim_create_user_command("WA", function()
    local project_dir = vim.fn.getcwd()
    local buffers = vim.api.nvim_list_bufs()
    local saved_count = 0

    for _, buf_id in ipairs(buffers) do
        if close_file.is_buffer_writable(buf_id) then
            local success = pcall(function()
                vim.api.nvim_buf_call(buf_id, function()
                    vim.lsp.buf.format()
                    vim.cmd("silent write")
                end)
            end)

            if success then
                local curr_file = vim.api.nvim_buf_get_name(buf_id)
                local display = curr_file:gsub("^" .. vim.pesc(project_dir) .. "/", "@/")
                fidget.notify(display, vim.log.levels.INFO, { annote = "saved file" })
                saved_count = saved_count + 1
            else
                local curr_file = vim.api.nvim_buf_get_name(buf_id)
                local display = curr_file:gsub("^" .. vim.pesc(project_dir) .. "/", "@/")
                fidget.notify(display, vim.log.levels.ERROR, { annote = "failed to save" })
            end
        end
    end

    if saved_count > 0 then
        fidget.notify(string.format("saved %d buffer(s)", saved_count), vim.log.levels.INFO, { annote = "write all" })
    else
        fidget.notify("no writable buffers to save", vim.log.levels.WARN, { annote = "write all" })
    end
end, { desc = "write all writable buffers" })
