return {
    "none-ls.nvim",
    event = "DeferredUIEnter",
    priority = 1000,
    after = function()
        local null_ls = require("null-ls")
        local h = require("null-ls.helpers")
        local u = require("null-ls.utils")

        -- deno fmt needs --ext when reading from stdin, since stdin has no extension
        local ft_to_ext = {
            javascript = "js",
            javascriptreact = "jsx",
            typescript = "ts",
            typescriptreact = "tsx",
            json = "json",
            jsonc = "jsonc",
            markdown = "md",
        }

        local deno_fmt = h.make_builtin({
            name = "deno_fmt",
            meta = {
                url = "https://docs.deno.com/runtime/reference/cli/fmt/",
                description = "Formats code using `deno fmt`.",
            },
            method = null_ls.methods.FORMATTING,
            filetypes = vim.tbl_keys(ft_to_ext),
            generator_opts = {
                command = "deno",
                args = function(params)
                    return { "fmt", "--ext", ft_to_ext[params.ft] or "ts", "-" }
                end,
                to_stdin = true,
                -- run from the project root so a deno.json/deno.jsonc there gets picked up
                cwd = function(params)
                    return u.root_pattern("deno.json", "deno.jsonc")(params.bufname)
                end,
            },
            factory = h.formatter_factory,
        })

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.nixfmt,
                null_ls.builtins.formatting.prettierd,
                deno_fmt.with({
                    condition = function(utils)
                        return utils.root_has_file({ "deno.json", "deno.jsonc" })
                    end,
                }),
            },
        })
    end,
}
