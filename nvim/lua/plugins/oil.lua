return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "size",
        }
    },
    init = function()
        vim.keymap.set("n", "\\", function()
            require("oil").toggle_float()
        end)
    end
}
