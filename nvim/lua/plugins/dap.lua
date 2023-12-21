return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
    },
    init = function()
        require("mason-nvim-dap").setup()
    end
}
