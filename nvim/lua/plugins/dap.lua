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
        local binds = require("keybinds")

        map("n", binds.diag_continue, function() dap.continue() end, {})
        map("n", binds.diag_step_over, function() dap.step_over() end, {})
        map("n", binds.diag_step_into, function() dap.step_into() end, {})
        map("n", binds.diag_step_out, function() dap.step_out() end, {})
        map("n", binds.diag_toggle_breakpoint, function() dap.toggle_breakpoint() end, {})
        map("n", binds.diag_open_repl, function() dap.repl.open() end, {})
    end
}
