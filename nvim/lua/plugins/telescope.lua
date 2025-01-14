return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            version = "^1.0.0",
        },
    },
    opts = {},
    lazy = true,
    init = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        telescope.load_extension("live_grep_args")

        local map = vim.keymap.set
        local binds = require("keybinds")

        map("n", binds.find_file, builtin.find_files, { desc = "Find files" })
        map('n', binds.find_string, telescope.extensions.live_grep_args.live_grep_args, { desc = "Find grep" })
        map('n', "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        map('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
        map('n', '<C-p>', builtin.find_files, { desc = "Find files" })
        map("n", "<leader>fw", builtin.grep_string, { desc = "Find word" })
        map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics messages" })

        vim.api.nvim_create_user_command("Explore", builtin.find_files, { desc = "Find files" })
        vim.api.nvim_create_user_command("E", builtin.find_files, { desc = "Find files" })

    end,
}
