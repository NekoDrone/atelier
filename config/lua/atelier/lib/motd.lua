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
        message = "we accept this memory, and move beyond its reach.",
        author = "layla ness-tan",
    },
    {
        message = "nix fixes this",
        author = "isabel",
    },
    {
        message = "/(i(z|[sz]{2}y|sabel)|bell([ae]?|er))/",
        author = "isabel",
    },
    {
        message = "i love evergarden, it's the best colourscheme",
        author = "roro, probably",
    },
    {
        message = "everyone shines, even if they're a little spark",
        author = "roro",
    },
    {
        message = "hiya!",
        author = "roro",
    },
    {
        message = "you die if you work",
        author = "dizzy",
    },
    {
        message = "unfortunately due to forseen circumstances that were well within my control, i will be late.",
        author = "elissa/pingu/blahai",
    },
    {
        message = "miss mizzle",
        author = "lua",
    },
    {
        message = "if i could make everyone on this planet pee themselves, i would.",
        author = "april",
    },
    {
        message = "welcome to emacs!",
        author = "fifty six",
    },
    {
        message = "I have a suggestion.",
        author = "isuggestforcefem",
    },
    {
        message = "i paid this kita to stare at you",
        author = "dizzy and elissa/pingu/blahai",
    },
    {
        message = "where exe?",
        author = "kaya",
    },
    {
        message = "well, there's work to be done. yeah, we have to live to do it though, don't we?",
        author = "vel sartha and mon mothma",
    },
    {
        message = "despite everything, it's still you.",
        author = "undertale",
    },
    {
        message = "hope is a choice",
        author = "unknown",
    },
    {
        message = "*sipping coffee* wonderhoy!!",
        author = "lin",
    },
    {
        message = "the vim adventures of syllie and aumy",
        author = "autumn",
    },
    {
        message = "light up the fire to that awakening beat, my vivids",
        author = "nenori",
    },
    {
        message = "o, lone sheep, go tear the darkness to pieces",
        author = "peg",
    },
    {
        message = "you listen to hard rock music, i listen to music rock hard",
        author = "wicket",
    },
    {
        message = "how about you spend another 8 hours ricing instead of work today?",
        author = "ari",
    },
    {
        message = "go to sleep",
        author = "isabel",
    },
    {
        message = "it's not legendary unless your friends are there to see it",
        author = "barney stinson (himym)",
    },
    {
        message = "nothing good happens after 2am",
        author = "ted's mom (himym)",
    },
    {
        message = "how much wood could a woodchuck chuck if a woodchuck could chuck wood",
        author = "unknown",
    },
    {
        message = "how much chuck would a chuckwood wood if a chuckwood would wood chuck",
        author = "em",
    },
    {
        message = "the only thing we have to fear is big scary monsters",
        author = "seth",
    },
    {
        message = "arf arf arf arf",
        author = "busgirl",
    },
    {
        message = "i'm already sitting down and i want nothing more than to sit down",
        author = "@poggers.website",
    },
    {
        message = "violence in all hands, embrace it if need be",
        author = "rage against the machine",
    },
    {
        message = "how long? not long, because you reap what you sow",
        author = "rage against the machine",
    },
    {
        message = "hey guys check it out i'm the grungler",
        author = "sapph",
    },
    {
        message = "hey guys check it out i'm the grungler",
        author = "kold",
    },
    {
        message = "hey guys check it out i'm the grungler",
        author = "the grungler",
    },
    {
        message = 'some people, when confronted with a problem, think "i know, i\'ll use regular expressions!" now they have two problems.',
        author = "jamie zawinsky",
    },
    {
        message = "it is the nature of a thing that matters, not it's form.",
        author = "brok, god of war ragnarok",
    },
    {
        message = "i see now that the circumstances of one's birth is irrelevant. it is what you do with the gift of life that determines who you are.",
        author = "mewtwo",
    },
    {
        message = "the light lives in all places. you can block it, even try to trap it, but the light always finds its way.",
        author = "the speaker, destiny 2",
    },
    {
        message = "everybody loves a bad idea when it works.",
        author = "cayde-6, destiny 2",
    },
    {
        message = "guardians make their own fate",
        author = "destiny the game",
    },
    {
        message = "you now face godlike judgement. may it extend eternally.",
        author = "clovis bray i, destiny 2",
    },
    {
        message = "devotion, bravery, sacrifice.",
        author = "the guardian creed, destiny",
    },
    {
        message = "if you hesitate when asking (me) a question, you're probably better off not asking.",
        author = "lua",
    },
    {
        message = "i can't really come up with a serious quote right now. love yourself tho",
        author = "lin",
    },
    {
        message = "emacs is a great operating system, but it's missing a good text editor.",
        author = "ancient vim proverb",
    },
    {
        message = "recovery is a spiral, not a circle. you may return to the same patterns but you will break free.",
        author = "eris morn, destiny 2",
    },
    {
        message = "often, when we guess at others' motives, we reveal only our own.",
        author = "queen mara sov, destiny 2",
    },
    {
        message = "sorry, it's lupus.",
        author = "gregory house",
    },
    {
        message = "i too am in this episode",
        author = "james wilson",
    },
    {
        message = "be unstoppable.",
        author = "serenity",
    },
    {
        message = "are we there yet",
        author = "hotsocket",
    },
    {
        message = "and then somebody somewhere finds, the warmth of summer in the songs you write.",
        author = "porter robinson",
    },
    {
        message = "to all of our sisters who did not make it. may we carry the light of their torch into another day.",
        author = "katie t.",
    },
    {
        message = "awawawawa",
        author = "harmy <3",
    },
}

function M.get_random()
    -- not so random because i should be told to go sleep.
    local now = os.date("*t")
    if now.hour > 0 and now.hour <= 7 then
        return motds[26]
    end

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
