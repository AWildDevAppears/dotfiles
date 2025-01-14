return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Testing hooks
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
        "marilari88/neotest-vitest",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python"),
                require('neotest-jest')({
                    jestCommand = "nx test --test-file",
                    jestConfigFile = function(file)
                        if string.find(file, "/frontend/") then
                            return string.match(file, "(.-/[^/]+/)") .. "jest.config.ts"
                        end

                        return vim.fn.getcwd() .. "/jest.config.ts"
                    end,
                    env = { CI = true },
                    cwd = function()
                        return vim.fn.getcwd()
                    end,
                }),
                require("neotest-vitest"),

            }
        })

        vim.keymap.set("n", "<leader>dg", function() neotest.run.run() end, {})
        vim.keymap.set("n", "<leader>dG", function() neotest.run.run(vim.fn.exp("%")) end, {})
        vim.keymap.set("n", "<leader>dE", function() neotest.run.run({ strategy = "dap" }) end, {})
        vim.keymap.set("n", "<leader>d!", function() neotest.run.stop() end, {})
    end
}
