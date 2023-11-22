return {
    "stevearc/aerial.nvim",
    opts = {
        on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
        backends = { "treesitter", "lsp", "man" },
        layout = {
            min_width = 30,
        },
        show_guides = true,
        filter_kind = {
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Interface",
            "Module",
            "Method",
            "Namespace",
            "Object",
            "Package",
            "Property",
            "Struct",
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
