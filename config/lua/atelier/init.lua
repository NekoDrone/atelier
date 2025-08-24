require("atelier.config.disables")
require("atelier.config.opts")
require("atelier.config.keybinds")
require("atelier.config.lsp")
require("lz.n").load("atelier.plugins")

require("atelier.config.commands")
require("atelier.config.theme")
require("atelier.config.treesitter")
require("atelier.config.lazygit")

vim.notify("waho atelier")
