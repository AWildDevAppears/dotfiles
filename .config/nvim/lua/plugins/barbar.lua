-- BarBar
-- Adds a bar to the top of the page that shows my open buffers
return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    init = function()
        local binds = require("keybinds");
        vim.g.barbar_auto_setup = false
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", binds.next_buffer, "<Cmd>BufferNext<cr>", opts)
        map("n", binds.prev_buffer, "<Cmd>BufferPrevious<cr>", opts)
    end
}
