-- use ripgrep for :grep
vim.opt.grepprg = "rg --vimgrep"

-- use all colours (fwiw i use ghostty)
vim.o.termguicolors = true

-- show line numbers and make current line absolute, other lines relative
vim.opt.number = true
vim.opt.relativenumber = true

-- winborder
vim.o.winborder = "rounded"

-- folds
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
