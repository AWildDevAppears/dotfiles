return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "hrsh7th/nvim-cmp",
            event = { "InsertEnter", "CmdlineEnter" },
        },
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "hrsh7th/cmp-buffer",
        },
        {
            "hrsh7th/cmp-path",
        },
        {
            "hrsh7th/cmp-cmdline",
        },
        {
            "folke/neodev.nvim",
        },
        {
            "williamboman/mason.nvim"
        },
        {
            "williamboman/mason-lspconfig.nvim",
        },
        {
            "yioneko/nvim-vtsls",
        },
    },
    init = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        vim.lsp.inlay_hint.enable()

        -- Setup LSPconfig
        local lspconfig = require('lspconfig')

        -- LSP features
        vim.lsp.inlay_hint.enable()

        local tsserver_langsettings = {
            format = {
                indentStyle = "Smart",
                insertSpaceAfterCommaDelimiter = true,
                trimTrailingWhitespace = true,

            },
            inlayHints = {
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
            },
        }

        local tssettings = {
            implicitProjectConfiguration = {
                checkJs = true,
                strictNullChecks = true,
            },
            typescript = tsserver_langsettings,
            javascript = tsserver_langsettings,
        }

        require("lspconfig.configs").vtsls = require("vtsls").lspconfig

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = { "lua_ls", "bashls", "ts_ls", "basedpyright" },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["bashls"] = function()
                    lspconfig.bashls.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "sh",
                            "zsh",
                            "fish",
                        },
                        command = { "bash-language-server", "start" },
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace",
                                },
                                diagnostics = {
                                    globals = "vim"
                                },
                                hint = { enable = true },
                            }
                        },
                    })
                end,
                ["ts_ls"] = function()
                    lspconfig.ts_ls.setup({
                        capabilities = capabilities,
                        filetypes = {
                            "typescript",
                            "typescriptreact",
                            "typescript.tsx",
                            "vue",
                            "javascript",
                            "javascriptreact",
                            "javascript.jsx",
                        },
                        inlay_hints = {
                            enabled = true,
                        },
                        cmd = { "typescript-language-server", "--stdio" },
                        settings = tssettings,
                        root_dir = function(fname)
                            return lspconfig.util.root_pattern 'tsconfig.json' (fname)
                                or lspconfig.util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
                        end,
                    })
                end,
                ["basedpyright"] = function()
                    lspconfig.basedpyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    strictListInference = true,
                                    strictDictionaryInference = true,
                                    strictSetInference = true,
                                    strictParameterNoneValue = true,
                                    diagnosticMode = "openFilesOnly",
                                    stubPath = "./typings",
                                    inlayHints = true,
                                },

                            },
                        },
                    })
                end,
            }
        })

        vim.filetype.add({
            extension = {
                templ = "templ"
            }
        })

        vim.diagnostic.config({
            virtual_text = false
        })

        vim.keymap.set("n", "<leader>J", function()
            vim.diagnostic.open_float(nil, { focus = false })
        end)
    end,
}
