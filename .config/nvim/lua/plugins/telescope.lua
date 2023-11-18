return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {},
    init = function()
        local builtin = require("telescope.builtin")

        local map = vim.keymap.set

        map("n", "<leader>ff", builtin.find_files, {})
        map('n', '<leader>fg', builtin.live_grep, {})
        map('n', '<leader>fb', builtin.buffers, {})
        map('n', '<leader>fh', builtin.help_tags, {})
        map('n', '<C-p>', builtin.find_files, {})
    end,
}
