return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim"
    },
    lazy = true,
    opts = {
    },
    keys = {
        {
            "<leader>tt",
            function()
                require("trouble").toggle()
            end,
            mode = { "n" },
        },
        {
            "<leader>tw",
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
            mode = { "n" },
        },
        {
            "<leader>td",
            function()
                require("trouble").toggle("document_diagnostics")
            end,
            mode = { "n" },
        },
        {
            "<leader>tq",
            function()
                require("trouble").toggle("quickfix")
            end,
            mode = { "n" },
        },
        {
            "<leader>tl",
            function()
                require("trouble").toggle("loclist")
            end,
            mode = { "n" },
        },
    },
}
