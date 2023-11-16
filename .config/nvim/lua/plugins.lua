vim.g.mapleader = " "

local plugins = {
    {
        "folke/neodev.nvim"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim"
        },
        config = function()
            vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
            vim.cmd([[nnoremap C-b :Neotree toggle<cr>]])
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    -- LSP
    ---- Mason
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    ---- LSP
    {
        "neovim/nvim-lspconfig",
    },
    ---- CMP
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
        "hrsh7th/nvim-cmp",
    },
    ---- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
    },
    -- Theme
    {
        "Shatur/neovim-ayu",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        init = function(plugin)
            -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
            -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
            -- no longer trigger the **nvim-treeitter** module to be loaded in time.
            -- Luckily, the only thins that those plugins need are the custom queries, which we make available
            -- during startup.
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
        end,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                config = function()
                    -- When in diff mode, we want to use the default
                    -- vim text objects c & C instead of the treesitter ones.
                    local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
                    local configs = require("nvim-treesitter.configs")
                    for name, fn in pairs(move) do
                        if name:find("goto") == 1 then
                            move[name] = function(q, ...)
                                if vim.wo.diff then
                                    local config = configs.get_module("textobjects.move")
                                        [name] ---@type table<string,string>
                                    for key, query in pairs(config or {}) do
                                        if q == query and key:find("[%]%[][cC]") then
                                            vim.cmd("normal! " .. key)
                                            return
                                        end
                                    end
                                end
                                return fn(q, ...)
                            end
                        end
                    end
                end,
            },
            {
                "nvim-treesitter/nvim-treesitter-context",
                enabled = true,
                opts = { mode = "cursor", max_lines = 3 },
                keys = {
                    {
                        "<leader>ut",
                        function()
                            local Util = require("lazyvim.util")
                            local tsc = require("treesitter-context")
                            tsc.toggle()
                            if Util.inject.get_upvalue(tsc.toggle, "enabled") then
                                Util.info("Enabled Treesitter Context", { title = "Option" })
                            else
                                Util.warn("Disabled Treesitter Context", { title = "Option" })
                            end
                        end,
                        desc = "Toggle Treesitter Context",
                    },
                },
            },
        },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
    -- Formatter
    {
        "stevearc/conform.nvim",
        opts = {},
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
    },
    -- Linting
    {
        "mfussenegger/nvim-lint",
    },
    -- Dressing
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
    }
}

require("lazy").setup(plugins)
