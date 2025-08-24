-- fancier :w command
vim.api.nvim_create_user_command("W", function()
    vim.lsp.buf.format()
    vim.cmd("silent write")
    local project_dir = vim.fn.getcwd()
    local fidget = require("fidget")
    local curr_file = vim.fn.expand("%:p")

    local display = curr_file:gsub("^" .. vim.pesc(project_dir) .. "/", "@/")
    fidget.notify(display, vim.log.levels.INFO, { annote = "saved file" })
end, { desc = "fancier :w command" })
