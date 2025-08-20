local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "",
    " 𝔀𝓮𝓵𝓬𝓸𝓶𝓮 𝓽𝓸",
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
    "                     - 𝓫𝔂 𝓼𝓮𝓻𝓮𝓷𝓲𝓽𝔂, 𝓽𝓱𝓮 𝓰𝓸𝓵𝓭𝔀𝓮𝓪𝓿𝓮𝓻 󰉊",
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
    "                                      - serenity, the goldweaver",
    " ",
    " ",
    "                      plugins loaded: <tbd>                    ",
}

return dashboard.opts
