return {
    "mfussenegger/nvim-lint",
    init = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = { "vale" },
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            html = { "tidy" },
            -- lua = { "luacheck" }
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
