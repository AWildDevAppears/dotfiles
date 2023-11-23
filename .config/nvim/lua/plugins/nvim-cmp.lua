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
        vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
        vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
        vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)

        -- local has_words_before = function()
        --    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --    return col ~= 0 and
        --        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        -- end

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
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    {
                        "i",
                        "s"
                    }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                    {
                        "i",
                        "s"
                    }),
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
                { name = "buffer" },
            })
        })
    end,
}
