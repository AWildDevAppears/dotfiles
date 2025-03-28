local binds = require("keybinds")

vim.g.snacks_animate = false

return {
    "folke/snacks.nvim",
    lazy = false,
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    -- @type snacks.Config
    opts = {
        statuscolumn = {
            left = { "mark", "sign" },
            right = { "fold", "git" },
            enabled = true,
        },
    },
    keys = {
        { binds.find_file,
            function()
                Snacks.picker.smart()
            end },
        {
            binds.find_string,
            function()
                Snacks.picker.grep()
            end
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.diagnostics_buffer()
            end
        },
        {
            binds.hover_docs,
            function()
                vim.lsp.buf.signature_help()
            end
        },
        {
            binds.rename,
            function()
                vim.lsp.buf.rename()
            end
        },
        {
            binds.diag_next,
            function()
                vim.diagnostic.goto_next()
            end
        },
        {
            binds.diag_prev,
            function()
                vim.diagnostic.goto_prev()
            end
        },
        {
            binds.goto_references,
            function()
                vim.lsp.buf.references()
            end
        },
        {
            binds.goto_definition,
            function()
                vim.lsp.buf.definition()
            end
        },
        {
            binds.goto_type_definition,
            function()
                vim.lsp.buf.type_definition()
            end
        },
        {
            binds.toggle_term,
            function ()
                Snacks.terminal.toggle()
            end
        }
    },

}
