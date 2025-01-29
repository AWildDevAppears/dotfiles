return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    init = function ()
        local fzf = require("fzf-lua")
        local map = vim.keymap.set
        local binds = require("keybinds")


        map("n", binds.find_file, fzf.files, { desc = "Find files" })
        map('n', binds.find_string, fzf.live_grep, { desc = "Find grep" })
        map('n', "<leader>fb", fzf.buffers, { desc = "Find buffers" })
        map('n', '<leader>fh', fzf.tags, { desc = "Find help tags" })
        map('n', '<C-p>', fzf.files, { desc = "Find files" })
        map("n", "<leader>fw", fzf.grep_cword, { desc = "Find word" })
        map("n", "<le\ader>fd", fzf.diagnostics_workspace, { desc = "Find diagnostics messages" })

        map("n", binds.hover_docs, function () vim.lsp.buf.signature_help() end, { desc = "Hover docs" })
        map("n", binds.rename, function () vim.lsp.buf.rename() end, { desc = "Rename" })
        map("n", binds.code_actions, function () fzf.lsp_code_actions() end, { desc = "Code actions" })
        map("n", binds.goto_type_definition, function () vim.lsp.buf.type_definition() end, { desc = "Goto type definition"})
        map("n", binds.goto_definition, function () vim.lsp.buf.definition() end, { desc = "Goto definition"})
        map("n", binds.goto_references, function () fzf.lsp_finder() end, { desc = "Goto references" })
        map("n", binds.diag_next, function() vim.diagnostic.goto_next() end)
        map("n", binds.diag_prev, function() vim.diagnostic.goto_prev() end)

    end
}
