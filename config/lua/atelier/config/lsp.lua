-- diganostic config to use our icons
local diagnostic_config = {
    [vim.diagnostic.severity.ERROR] = { sign = "", hl = "DiagnosticSignError" },
    [vim.diagnostic.severity.WARN] = { sign = "", hl = "DiagnosticSignWarn" },
    [vim.diagnostic.severity.HINT] = { sign = "", hl = "DiagnosticSignHint" },
    [vim.diagnostic.severity.INFO] = { sign = "", hl = "DiagnosticSignInfo" },
}

vim.diagnostic.config({
    signs = {
        enabled = true,
        text = (function()
            local res = {}
            for key, value in pairs(diagnostic_config) do
                res[key] = value.sign
            end
            return res
        end)(),
        numhl = (function()
            local res = {}
            for key, value in pairs(diagnostic_config) do
                res[key] = value.hl
            end
            return res
        end)(),
    },
    virtual_text = {
        enabled = true,
        spacing = 8,
        prefix = function(diagnostic)
            local config = diagnostic_config[diagnostic.severity]
            return config and config.sign or "●"
        end,
    },
})

local util = require("lspconfig.util")

local lsp_servers = {
    lua_ls = {
        settings = {
            Lua = {
                semantic = {
                    enable = false,
                },
                diagnostics = {
                    globals = { "vim" },
                },
                hint = {
                    enable = true,
                    arrayIndex = "Disable",
                },
            },
        },
    },
    vtsls = {
        init_options = {
            preferences = {
                includePackageJsonAutoImports = "on",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
                allowTextChangesInNewFiles = true,
            },
            suggest = {
                autoImports = true,
            },
        },
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = false,
                    includeInlayEnumMemberValueHints = true,
                },
                preferences = {
                    includePackageJsonAutoImports = "on",
                    includeCompletionsForModuleExports = true,
                    includeCompletionsForImportStatements = true,
                    importModuleSpecifier = "non-relative",
                    allowTextChangesInNewFiles = true,
                },
                suggest = {
                    autoImports = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = false,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },
    html = {},
    cssls = {},
    jsonls = {},
    eslint = {},
    tailwindcss = {},
    gleam = {},
    gopls = {},
    rust_analyzer = {},
    nil_ls = {},
    astro = {
        cmd = { "astro-ls", "--stdio" },
        filetypes = { "astro" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        init_options = {
            typescript = {},
        },
        before_init = function(_, config)
            if config.init_options and config.init_options.typescript and not config.init_options.typescript.tsdk then
                config.init_options.typescript.tsdk = util.get_typescript_server_path(config.root_dir)
            end
        end,
    },
}

local blink = require("blink.cmp")

for language, config in pairs(lsp_servers) do
    config.capabilities = blink.get_lsp_capabilities()
    vim.lsp.enable(language)
    vim.lsp.config(language, config)
end
