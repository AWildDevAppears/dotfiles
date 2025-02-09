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
    import = "plugins.formatters",
    config = function(_, opts)
        local formatters = {}
        for formatter, formatter_settings in pairs(opts) do
            formatter = formatter:gsub("_", "-")
            formatters[formatter] = {
                prepend_args = function(_, ctx)
                    if has_local_config(ctx.filename, formatter_settings.config_names) then
                        return {}
                    else
                        if formatter_settings.continuous_string then
                            return {
                                formatter_settings.config_command .. configs_location .. formatter_settings.config_path,
                            }
                        else
                            return {
                                formatter_settings.config_command,
                                configs_location .. formatter_settings.config_path,
                            }
                        end
                    end
                end,
            }
        end

        require("conform").setup({
            format = {
                timeout_ms = 3000,
                async = false,
                quiet = false,
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formattters_by_ft = {
                ["*"] = { "codespell", "trim_whitespace" },
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                vue = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                golang = { "gofumpt", "goimports", "golines" },
            },
            formatters = formatters,
        })
    end,
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = { "ConformInfo" },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            pattern = "*",
            command = [[%s/\s\+$//e]],
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_fallback = true, range = range })
        end, { range = true })

        local binds = require("keybinds")

        vim.keymap.set("n", binds.file_format, "<cmd>Format<cr>", {})
        vim.keymap.set("n", binds.macro_file_format, "<cmd>Format<cr>", {})
    end
}
