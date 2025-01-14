return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            signature = {
                auto_open = { enabled = true },
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = false,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
