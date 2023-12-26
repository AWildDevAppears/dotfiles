return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = "ayu_mirage",
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

        vim.keymap.set("n", "<A-1>", "<Cmd>LualineBuffersJump! 1<cr>")
        vim.keymap.set("n", "<A-2>", "<Cmd>LualineBuffersJump! 2<cr>")
        vim.keymap.set("n", "<A-3>", "<Cmd>LualineBuffersJump! 3<cr>")
        vim.keymap.set("n", "<A-4>", "<Cmd>LualineBuffersJump! 4<cr>")
        vim.keymap.set("n", "<A-5>", "<Cmd>LualineBuffersJump! 5<cr>")
        vim.keymap.set("n", "<A-6>", "<Cmd>LualineBuffersJump! 6<cr>")
        vim.keymap.set("n", "<A-7>", "<Cmd>LualineBuffersJump! 7<cr>")
        vim.keymap.set("n", "<A-8>", "<Cmd>LualineBuffersJump! 8<cr>")
        vim.keymap.set("n", "<A-9>", "<Cmd>LualineBuffersJump! 9<cr>")
        vim.keymap.set("n", "<A-0>", "<Cmd>LualineBuffersJump! 10<cr>")

        vim.keymap.set("n", binds.next_buffer, "<Cmd>bnext<cr>")
        vim.keymap.set("n", binds.prev_buffer, "<Cmd>bprev<cr>")

        vim.keymap.set("n", "<S-A-d>", "<Cmd>bdelete<cr>")
    end
}
