local binds = require("keybinds")

vim.g.snacks_animate = false

return {
    "folke/snacks.nvim",
    lazy = false,
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    keys = {
        { binds.find_file,
            function()
                Snacks.picker.smart()
            end },
        {
            binds.find_string,
            function()
                Snacks.picker.grep()
            end
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.diagnostics_buffer()
            end
        },
    },

}
