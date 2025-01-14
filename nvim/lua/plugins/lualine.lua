return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = "ayu_dark",
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    mode = 2,
                    max_length = vim.o.columns * 2 / 3,
                }
            },
            lualine_z = { "filesize" },
        },
    },
    init = function()
        local binds = require("keybinds")

        vim.keymap.set("n", binds.next_buffer, "<Cmd>bnext<cr>")
        vim.keymap.set("n", binds.prev_buffer, "<Cmd>bprev<cr>")

        vim.keymap.set("n", "<S-A-d>", "<Cmd>bdelete<cr>")
    end
}
