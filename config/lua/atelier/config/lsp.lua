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
    ts_ls = {
        init_options = {
            preferences = {
                includePackageJsonAutoImports = "auto",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifierPreference = "relative",
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
                    includePackageJsonAutoImports = "auto",
                    includeCompletionsForModuleExports = true,
                    includeCompletionsForImportStatements = true,
                    importModuleSpecifierPreference = "relative",
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
}

for language, config in pairs(lsp_servers) do
    vim.lsp.enable(language)
    vim.lsp.config(language, config)
end
