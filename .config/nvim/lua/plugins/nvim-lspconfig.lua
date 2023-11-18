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
    },
    init = function()
        local servers = {
            -- Lua
            "lua_ls",

            -- Rust
            "rust_analyzer",

            -- C
            "clangd",

            -- CSS
            "cssls",
            "cssmodules_ls",
            "emmet_ls",

            -- HTML
            "html",

            -- JS
            "jsonls",
            "tsserver",

            -- Vue
            "volar",

            -- Markdown
            "zk",

            -- Python
            "pyright",

            -- TOML
            "taplo",
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local map = vim.keymap.set
        local on_attach = function(_, buffer)
            local bufopts = { noremap = true, silent = true, buffer = buffer }
            map("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
            map("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
            map("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
            map("n", "<leader>gr", vim.lsp.buf.rename, bufopts)
        end

        -- Setup LSPconfig
        local lspconfig = require('lspconfig')

        for _, lsp in ipairs(servers) do
            if lsp == "lua_ls" then
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            }
                        }
                    },
                })
            else
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end
    end,
}
