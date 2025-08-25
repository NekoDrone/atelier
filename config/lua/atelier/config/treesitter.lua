-- add treesitter file types here
-- don't forget to install the grammar in the default.nix file!
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "typescriptreact", -- .tsx
        "javascriptreact", -- .jsx
        "json",
        "svelte",
        "vue",
        "astro",
        "xml",
        "graphql",

        "lua",
        "nix",
        "rust",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "c",
        "cpp",
        "zig",
        "odin",

        "vim",
        "bash",
        "python",
        "java",
        "php",
        "ruby",
        "elixir",
        "erlang",
        "haskell",
        "ocaml",
        "fsharp",
        "swift",
        "kotlin",
        "gleam",
        "elm",
        "fish",
        "powershell", -- because i hate myself
        "pwsh",
        "yaml", -- because i hate myself
        "toml",
        "ini",
        "csv", -- because i hate myself
        "sql",
        "dockerfile",
        "nginx",
        "markdown",
        "tex", -- latex
        "templ",
        "tera",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
