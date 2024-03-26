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
        formattters_by_ft = {
            ["*"] = { "codespell", "trim_whitespace" },
            lua = { "stylua" },
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            golang = { "gofumpt", "goimports", "golines" },
        }
    },
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

        vim.keymap.set("n", "<leader>lu", "<cmd>Format<cr>", {})
    end
}
