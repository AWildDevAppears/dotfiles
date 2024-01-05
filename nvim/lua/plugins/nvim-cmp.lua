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
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },
        {
            "onsails/lspkind.nvim",
        },
        {
            "nvimdev/lspsaga.nvim",
            config = function()
                require("lspsaga").setup({})
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

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<cr>")
        vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
        vim.keymap.set("n", "<leader>K", "<Cmd>Lspsaga hover_doc<cr>", opts)
        vim.keymap.set("n", "<C-a>", "<Cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set({ "n", "t" }, "<A-t>", "<Cmd>Lspsaga term_toggle<cr>", opts)
        vim.keymap.set("n", "<leader>r", "<Cmd>Lspsaga rename<cr>", opts)
        vim.keymap.set("n", "<leader>ga", "<Cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", "<leader>gd", "<Cmd>Lspsaga finder def<cr>", opts)
        vim.keymap.set("n", "<leader>gD", "<Cmd>Lspsaga finder ref<cr>", opts)
        vim.keymap.set("n", "<leader>gi", "<Cmd>Lspsaga finder impl<cr>", opts)

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
                },
                {
                    name = "nvim_lua",
                },
                {
                    name = "luasnip",
                    option = {
                        use_show_condition = false,
                        show_autosnippets = true,
                    },
                },
                {
                    name = "buffer",
                },
                {
                    name = "path",
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

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )

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
