local configs_location = vim.fn.stdpath("config") .. "/configs/"

function has_local_config(location, config_names)
    local has = false
    for i in pairs(config_names) do
        local found = vim.fs.find(config_names[i], { upward = true, location })
        if not (next(found) == nil) then
            has = true
            break
        end
    end
    return has
end

return {
    "stevearc/conform.nvim",
    opts = {
        format = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            golang = { "gofumpt", "goimports", "golines" },
            ["*"] = { "codespell", "trim_whitespace" },
        },
    },
    dependencies = { "mason.nvim" },
}
