return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/which-key.nvim",
    },
    opts = {},
    init = function()
        local builtin = require("telescope.builtin")

        local map = vim.keymap.set
        local binds = require("keybinds")

        map("n", binds.find_file, builtin.find_files, {})
        map('n', binds.find_string, builtin.live_grep, {})
        map('n', '<leader>fh', builtin.help_tags, {})
        map('n', '<C-p>', builtin.find_files, {})

        require("which-key").register({
            ["<leader>"] = {
                f = {
                    name = "+find",
                    f = { name = "Find file" },
                    g = { name = "Grep" },
                    b = { name = "Find in buffer" },
                    h = { name = "Help tags" },
                },
            }

        })
    end,
}
