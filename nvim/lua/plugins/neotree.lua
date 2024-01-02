return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim"
    },
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
            }
        }
    },
    init = function()
        vim.cmd([[nnoremap \ :Neotree toggle<cr>]])
        vim.cmd([[nnoremap <C-b> :Neotree toggle<cr>]])
    end
}
