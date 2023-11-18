return {
    "mfussenegger/nvim-lint",
    init = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = { "vale" },
            javascript = { "eslint" },
            typescript = { "eslint" },
            html = { "tidy" },
        }
    end,
}
