return {
    {
        "neo-tree.nvim",
        lazy = false,
        after = function()
            require("lz.n").trigger_load("nui-nvim")
            require("neo-tree").setup({
                popup_border_style = "",
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                    },
                },
                hijack_netrw_behavior = "open_current",
                default_component_configs = {
                    -- taken from https://github.com/comfysage/ivy/blob/main/config/lua/ivy/plugins/init.lua#L14-L36
                    -- thank you roro you're so cracked and so smart ily
                    icon = {
                        provider = function(icon, node) -- setup a custom icon provider
                            local text, hl
                            local mini_icons = require("mini.icons")
                            if node.type == "file" then -- if it's a file, set the text/hl
                                text, hl = mini_icons.get("file", node.name)
                            elseif node.type == "directory" then -- get directory icons
                                text, hl = mini_icons.get("directory", node.name)
                                -- only set the icon text if it is not expanded
                                if node:is_expanded() then
                                    text = nil
                                end
                            end

                            -- set the icon text/highlight only if it exists
                            if text then
                                icon.text = text
                            end
                            if hl then
                                icon.highlight = hl
                            end
                        end,
                    },
                },
            })
        end,
    },
}
