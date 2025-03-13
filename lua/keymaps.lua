-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>p", ":Rex<CR>")

vim.keymap.set("n", "<C-h>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>cprev<CR>")

vim.keymap.set({ "n", "i" }, "<C-j>", "<cmd>bprev<CR>")
vim.keymap.set({ "n", "i" }, "<C-k>", "<cmd>bnext<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({"i", "c"}, "<C-v>", "<C-r>+", { noremap = true, silent = true })
