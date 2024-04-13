return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Testing frameworks
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
        "marilari88/neotest-vitest",
        "nvim-neotest/neotest-go",
    },
    config = function()
        local neotest = require("neotest")
        local pytest = require("neotest-python")
        local jest = require("neotest-jest")
        local vitest = require("neotest-vitest")
        local go = require("neotest-go")

        local map = vim.keymap.set

        map("n", "<leader>dt", function() neotest.run.run() end, { desc = "Run test under cursor" })
        map("n", "<leader>dT", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run tests in file" })
        map("n", "<leader>d!", function() neotest.run.stop() end, { desc = "Stop all tests" })
        ---@diagnostic disable-next-line: missing-fields
        map("n", "<leader>dg", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug test" })
        map("n", "<leader>do", function() neotest.output_panel() end, { desc = "Show test output pane" })
        map("n", "<leader>ds", function() neotest.summary() end, { desc = "Show test summary" })

        ---@diagnostic disable-next-line: missing-fields
        neotest.setup({
            adapters = {
                pytest,
                jest({
                    jestConfigFile = function(file)
                        if string.find(file, "/frontend/") then
                            return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
                        end

                        return vim.fn.getcwd() .. "/jest.config.ts"
                    end,
                }),
                vitest,
                go,
            }
        })
    end,
}
