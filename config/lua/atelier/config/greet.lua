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
    dashboard.button("SPC eq", "  Open file browser..."),
    dashboard.button("SPC FF", "  Search project directory..."),
    dashboard.button("SPC GG", "  Open commits menu..."),
}

-- completly unecessary, i just like having a time readout here.
-- perf impact should be minimal, but the string concats are gonna be hellish to maintain.

local motd_lib = require("atelier.lib.motd")

local motd = motd_lib.get_random_formatted_motd()

local current_date = os.date("*t")
local current_day_name = os.date("%A")
local current_month_name = os.date("%B")

local is_am = current_date.hour < 12
local current_hour = is_am and current_date.hour or (current_date.hour == 12 and 12 or current_date.hour - 12)
local greetings = is_am and "good morning" or (current_hour < 6 and "good afternoon" or "good evening")

local indicator_suffixes = {
    "st",
    "nd",
    "rd",
}

local date_string = current_day_name
    .. ",  "
    .. current_date.day
    .. (current_date.day % 10 < 4 and indicator_suffixes[current_date.day % 10] or "th")
    .. " "
    .. current_month_name
    .. " "
    .. current_date.year

local time_string = "at  "
    .. (current_hour < 10 and "0" .. current_hour or current_hour)
    .. ":"
    .. (current_date.min < 10 and "0" .. current_date.min or current_date.min)
    .. (is_am and "AM" or "PM")

dashboard.section.footer.val = {
    "",
    "",
    "",
    motd.message,
    motd.author,
    "",
    "",
    motd_lib.pad_center(greetings .. "!", #motd.message),
    "",
    motd_lib.pad_center("it is currently", #motd.message),
    "",
    motd_lib.pad_center(date_string, #motd.message),
    motd_lib.pad_center(time_string, #motd.message),
    "",
    "",
    motd_lib.pad_center("what shall we make?", #motd.message),
}

return dashboard.opts
