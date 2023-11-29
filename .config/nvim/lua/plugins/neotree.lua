return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim"
    },
    opts = {},
    init = function()
        vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
        vim.cmd([[nnoremap <C-b> :Neotree toggle<cr>]])

        vim.cmd([[
            if !exists('$GIT_EXEC_PATH')
            augroup NEOTREE_AUGROUP
            autocmd!
            au VimEnter * lua vim.defer_fn(function() vim.cmd("Neotree show left") end, 10)
            augroup END
            endif
        ]])
    end
}
