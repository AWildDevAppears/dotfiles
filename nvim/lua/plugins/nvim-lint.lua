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
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
