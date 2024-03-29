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
                                }
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
                        cmd = { "typescript-language-server", "--stdio" }
                    })
                end,
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "off",
                                    strictListInference = true,
                                    strictDictionaryInference = true,
                                    strictSetInference = true,
                                },

                            },
                        },
                    })
                end,
                ["pylsp"] = function()
                    lspconfig.pylsp.setup({
                        capabilities = capabilities,
                        settings = {
                            pylsp = {
                                configurationSources = { "flake8" },
                                plugins = {
                                    autopep8 = {
                                        enabled = false,
                                    },
                                    yapf = {
                                        enabled = true,
                                    },

                                    -- Auto import
                                    rope_autoimport = {
                                        enabled = true,
                                        completions = {
                                            enabled = true,
                                        }
                                    },

                                    -- Definitions
                                    jedi_definitions = {
                                        enabled = true,
                                    },
                                    jedi_hover = {
                                        enabled = false,
                                    },

                                    -- Completion
                                    rope_completion = {
                                        enabled = true,
                                    },
                                    jedi_completion = {
                                        enabled = true,
                                        include_class_objects = true,
                                        include_function_objects = true,
                                        fuzzy = true,
                                        eager = true,
                                    },

                                    pycodestyle = {
                                        ignore = { "W100", "E501", "D100" },
                                    },

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

        vim.keymap.set("n", "<leader>J", function()
            vim.diagnostic.open_float(nil, { focus = false })
        end)
    end,
}
