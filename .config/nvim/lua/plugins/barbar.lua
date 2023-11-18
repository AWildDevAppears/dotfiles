return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    init = function()
        vim.g.barbar_auto_setup = false
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "<A-.>", "<Cmd>BufferNext<cr>", opts)
        map("n", "<A-,>", "<Cmd>BufferPrevious<cr>", opts)
    end
}
