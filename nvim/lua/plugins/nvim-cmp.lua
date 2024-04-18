return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
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
            "petertriho/cmp-git",
        },
        {
            "L3MON4D3/LuaSnip",
        },
        {
            "saadparwaiz1/cmp_luasnip",
        },
        {
            "onsails/lspkind.nvim",
        },
        {
            "nvimdev/lspsaga.nvim",
            config = function()
                require("lspsaga").setup({
                    symbols_in_winbar = {
                        enable = true,
                    },
                    implement = {
                        enable = true,
                    },
                    code_action = {
                        extend_gitsigns = true,
                    }
                })
            end,
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            }
        }
    },
    init = function()
        local luasnip = require("luasnip")

        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local keybinds = require("keybinds")

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", keybinds.hover_docs, "<Cmd>Lspsaga hover_doc<cr>", opts)
        vim.keymap.set({ "n", "t" }, keybinds.toggle_terminal, "<Cmd>Lspsaga term_toggle<cr>", opts)
        vim.keymap.set("n", keybinds.rename, "<Cmd>Lspsaga rename<cr>", opts)
        vim.keymap.set("n", keybinds.code_actions, "<Cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", keybinds.goto_type_definition, "<Cmd>Lspsaga goto_type_definition<cr>", opts)
        vim.keymap.set("n", keybinds.goto_definition, "<Cmd>Lspsaga goto_definition<cr>", opts)
        vim.keymap.set("n", keybinds.goto_references, "<Cmd>Lspsaga finder<cr>", opts)
        vim.keymap.set("n", keybinds.diag_next, function() vim.diagnostic.goto_next() end)
        vim.keymap.set("n", keybinds.diag_prev, function() vim.diagnostic.goto_prev() end)

        vim.api.nvim_create_user_command("Term", "<Cmd>Lspsaga term_toggle<cr>", {})
        vim.api.nvim_create_user_command("Te", "<Cmd>Lspsaga term_toggle<cr>", {})

        ---@diagnostic disable-next-line: missing-fields
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_character = "...",
                })
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                {
                    name = "nvim_lsp",
                    priority = 9,
                },
                {
                    name = "nvim_lua",
                    priority = 8,
                },
                {
                    name = "buffer",
                    priority = 7,
                },
                {
                    name = "luasnip",
                    option = {
                        use_show_condition = false,
                        show_autosnippets = true,
                    },
                    priority = 6,
                },
                {
                    name = "path",
                    priority = 5,
                },
            },
            ---@diagnostic disable-next-line: missing-fields
            sorting = {
                comparators = {
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.kind,
                },
            },
            enabled = function()
                -- disable completion in comments
                local context = require("cmp.config.context")
                -- keep command mode completion enabled when cursor is in a comment
                if vim.api.nvim_get_mode().mode == "c" then
                    return true
                else
                    return not context.in_treesitter_capture("comment") and
                        not context.in_syntax_group("Comment")
                end
            end
        })

        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            })
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path", },
            }, {
                { name = "cmdline", }
            })
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "buffer", },
            })
        })
    end,
}
