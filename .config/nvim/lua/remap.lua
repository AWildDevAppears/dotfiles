local wk = require("which-key")
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- left window
keymap("n", "<C-k>", "<C-w>k", opts) -- up window
keymap("n", "<C-j>", "<C-w>j", opts) -- down window
keymap("n", "<C-l>", "<C-w>l", opts) -- right window

-- move text up and down
keymap("n", "<a-j>", "<esc>:m .+1<cr>==gi", opts) -- Alt-j
keymap("n", "<a-k>", "<esc>:m .-2<cr>==gi", opts) -- Alt-k

-- press jk fast to exit insert mode
keymap("i", "jk", "<esc>", opts) -- Insert mode -> jk -> Normal mode
keymap("i", "kj", "<esc>", opts) -- Insert mode -> kj -> Normal mode
