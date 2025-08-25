-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- more disables here
-- disable showing mode as we have lualine
vim.opt.showmode = false

-- relevant shortmess
vim.opt.shortmess:append("W")
vim.opt.shortmess:append("I")
vim.opt.shortmess:append("S")

-- disable selection count in cmd gutter
vim.o.showcmd = false
