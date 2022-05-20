local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Telescope
keymap("n", "ff", "<CMD>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "fb", "<CMD>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "fg", "<CMD>lua require'telescope.builtin'.live_grep()<CR>", opts)
