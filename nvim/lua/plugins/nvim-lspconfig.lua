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
            "slint-ui/vim-slint"
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

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
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
                            "fish"
                        },
                        cmd = { "bash-language-server", "start" },
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
                ["tsserver"] = function()
                    lspconfig.tsserver.setup({
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
                        settings = {
                            typescript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                },
                            },
                            javascript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                },
                            },
                        },
                        inlay_hints = {
                            enabled = true,
                        },
                        cmd = { "typescript-language-server", "--stdio" }
                    })
                end,
                ["basedpyright"] = function()
                    lspconfig.basedpyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    -- typeCheckingMode = "off",
                                    strictListInference = true,
                                    strictDictionaryInference = true,
                                    strictSetInference = true,
                                    diagnosticMode = "openFilesOnly",
                                    stupPath = "./typings",

                                },

                            },
                        },
                    })
                end,
                ["ruff_lsp"] = function()
                    lspconfig.ruff_lsp.setup({
                        capabilities = capabilities,
                        on_attach = function(client, buffnr)
                            if client.name == "ruff_lsp" then
                                client.server_capabilities.hoverProvider = false
                            end
                        end
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
