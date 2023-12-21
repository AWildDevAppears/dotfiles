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
        local servers = {
            -- Lua
            "lua_ls",
            -- Rust
            "rust_analyzer",
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
            "vuels",
            -- Markdown
            "zk",
            -- Python
            "pyright",
            -- TOML
            "taplo",

            -- Slint
            "slint_lsp",

            -- GOlang
            "gopls",
        }

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local map = vim.keymap.set
        local on_attach = function(_, buffer)
            local bufopts = { noremap = true, silent = true, buffer = buffer }
            map("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
            map("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
            map("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
            map("n", "<leader>ga", vim.lsp.buf.code_action, bufopts)
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
            elseif lsp == "tsserver" then
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "vue" },
                    cmd = { "typescript-language-server", "--stdio" }
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
