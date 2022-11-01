vim.g.loaded_netrw = 1 vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

require("nvim-treesitter.configs").setup {
	ensure_installed = { "c", "lua", "rust", "javascript", "scss", "typescript", "vim", "toml" }
}

require("bufferline").setup()

require("lualine").setup {
    options = {
        theme = 'tokyonight' 
    }
}

