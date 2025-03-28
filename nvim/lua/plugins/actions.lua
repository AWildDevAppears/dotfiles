local binds = require("keybinds")

return {
    "aznhe21/actions-preview.nvim",
    config = function()
        local binds = require("keybinds")
        vim.keymap.set({ "v", "n" }, binds.code_actions, require("actions-preview").code_actions)
    end,
    -- keys = {
    --     {
    --         binds.hover_docs,
    --         function()
    --             vim.lsp.buf.signature_help()
    --         end
    --     },
    --     {
    --         binds.rename,
    --         function()
    --             vim.lsp.buf.rename()
    --         end
    --     },
    --     {
    --         binds.diag_next,
    --         function()
    --             vim.diagnostic.goto_next()
    --         end
    --     },
    --     {
    --         binds.diag_prev,
    --         function()
    --             vim.diagnostic.goto_prev()
    --         end
    --     },
    --     {
    --         binds.goto_references,
    --         function()
    --             vim.lsp.buf.references()
    --         end
    --     },
    --     {
    --         binds.goto_definition,
    --         function()
    --             vim.lsp.buf.definition()
    --         end
    --     },
    --     {
    --         binds.goto_type_definition,
    --         function()
    --             vim.lsp.buf.type_definition()
    --         end
    --     },
    -- }
}
