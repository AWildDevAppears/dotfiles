return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim"
    },
    opts = {
    },
    init = function()
        vim.keymap.set("n", "<leader>pb", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<leader>pw", function() require("trouble").toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>pd", function() require("trouble").toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>pq", function() require("trouble").toggle("quickfix") end)
        vim.keymap.set("n", "<leader>pl", function() require("trouble").toggle("loclist") end)
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

        local wk = require("which-key")

        wk.register({
            ["<leader>"] = {
                p = {
                    name = "+trouble",
                    b = { "toggle" },
                    w = { "toggle workspace" },
                    d = { "document" },
                    q = { "quickfix" },
                    l = { "loclist" },
                }
            }
        })
    end,
}
