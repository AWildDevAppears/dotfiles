return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
    },
    init = function()
        require("mason-nvim-dap").setup({
            ensure_installed = { "delve", "js", "chrome", "firefox", },
            automatic_installation = true,
        })

        local map = vim.keymap.set
        local dap = require("dap")

        map("n", "<F5>", function() dap.continue() end, {})
        map("n", "<F10>", function() dap.step_over() end, {})
        map("n", "<F11>", function() dap.step_into() end, {})
        map("n", "<F12>", function() dap.step_out() end, {})
        map("n", "<leader>db", function() dap.toggle_breakpoint() end, {})
        map("n", "<leader>dr", function() dap.repl.open() end, {})
    end
}
