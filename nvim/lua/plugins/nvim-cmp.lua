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
    },
    init = function()
        local luasnip = require("luasnip")

        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local keybinds = require("keybinds")

        local opts = { noremap = true, silent = true }
        -- TODO: Merge as much lspsaga functionality into telescope as possible.

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
