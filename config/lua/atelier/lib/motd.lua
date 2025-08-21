local M = {}

-- configure your messages here
local motds = {
    {
        message = "be kind, for the world is not. be life, for this earth is deadly.",
        author = "serenity, the goldweaver",
    },
    {
        message = "sois gentil , car le monde ne l'est pas .",
        author = "serenity, the goldweaver",
    },
    {
        message = "well, there's work to be done. yeah, we have to live to do it though, don't we?",
        author = "vel sartha and mon mothma",
    },
    {
        message = "hope is a choice",
        author = "unknown",
    },
    {
        message = "nix fixes this",
        author = "isabel roses",
    },
    {
        message = "roro's quote goes here",
        author = "roro",
    },
    {
        message = "",
        author = "layla ness-tan",
    },
}

function M.get_random()
    math.randomseed(os.time())
    local random_index = math.random(1, #motds)
    return motds[random_index]
end

local function pad_right(str, target_length)
    target_length = target_length or 25
    local current_length = string.len(str)

    if current_length >= target_length then
        return str
    end

    local padding = string.rep(" ", target_length - current_length)
    return str .. padding
end

local function pad_left(str, target_length)
    target_length = target_length or 25
    local current_length = string.len(str)

    if current_length >= target_length then
        return str
    end

    local padding = string.rep(" ", target_length - current_length)
    return padding .. str
end

function M.pad_center(str, target_length)
    target_length = target_length or 25
    local current_length = string.len(str)

    if current_length >= target_length then
        return str
    end

    local total_padding = target_length - current_length
    local left_padding = math.floor(total_padding / 2)
    local right_padding = total_padding - left_padding

    return string.rep(" ", left_padding) .. str .. string.rep(" ", right_padding)
end

function M.get_formatted_motd(motd)
    local target_length = #motd.message + 2

    return {
        message = target_length < 25 and M.pad_center(motd.message, 25) or pad_right(motd.message, target_length),
        author = pad_left("- " .. motd.author, target_length < 25 and 25 or target_length),
    }
end

function M.get_random_formatted_motd()
    return M.get_formatted_motd(M.get_random())
end

return M
