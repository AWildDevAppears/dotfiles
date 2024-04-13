return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim"
    },
    opts = {
    },
    init = function()
        vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end, { desc = "Toggle diagnostics" })
        vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end,
            { desc = "Toggle worspace diagnostics" })
        vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end,
            { desc = "Toggle document diagnostics" })
        vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end,
            { desc = "Toggle quickfix" })
        vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end,
            { desc = "Toggle loclist" })
        vim.keymap.set("n", "<leader>tf", "<cmd>TodoTrouble<cr>", { desc = "TODO list" })
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, {
            desc = "LSP references"
        })
    end,
}
