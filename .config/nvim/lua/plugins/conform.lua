
return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formattters_by_ft = {
            ["*"] = { "codespall", "trim_whitespace" },
            lua = { "stylua" },
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
        }
    },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    init = function ()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
}
