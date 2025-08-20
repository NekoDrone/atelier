local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "",
    "",
    "",
    " █████╗ ████████╗███████╗██╗     ██╗███████╗██████╗ ",
    "██╔══██╗╚══██╔══╝██╔════╝██║     ██║██╔════╝██╔══██╗",
    "███████║   ██║   █████╗  ██║     ██║█████╗  ██████╔╝",
    "██╔══██║   ██║   ██╔══╝  ██║     ██║██╔══╝  ██╔══██╗",
    "██║  ██║   ██║   ███████╗███████╗██║███████╗██║  ██║",
    "╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝",
    "",
    "",
    "",
}

dashboard.section.buttons.val = {
    dashboard.button("CTRL n", " New file..."),
    dashboard.button("SPC eq", " Open file browser..."),
    dashboard.button("CTRL f", " Search directory..."),
    dashboard.button("SPC G", " Open commits menu..."),
}

dashboard.section.footer.val = {
    "",
    "",
    "",
    "be kind, for the world is not. be life, for the world is deadly.",
    " ",
    "                                     - serenity, your goldweaver",
    " ",
    " ",
    "                      plugins loaded: <tbd>                    ",
}

return dashboard.opts
