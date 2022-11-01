local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader><C-l>", "<C-w>v", opts)
keymap("n", "<leader><C-h>", "<C-w>v", opts)
keymap("n", "<leader><C-j>", "<C-w>s", opts)
keymap("n", "<header><C-k>", "<C-w>s", opts)


keymap("n", "<leader>l", ":bn<cr>", opts)
keymap("n", "<leader>h", ":bp<cr>", opts)


-- Resize
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Inster mode
keymap("i", "jk", "<Esc>", opts)

-- Tree
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Trouble
keymap('n', '<leader>tt', ':TroubleToggle', opts)
keymap('n', '<leader>tr', ':TroubleRefresh', opts)
