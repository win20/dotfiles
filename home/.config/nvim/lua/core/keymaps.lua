-- [[ Vim keymaps ]]
--  See `:help vim.keymap.set()`
--  Plugin specific keymaps are defined in their own configs

-- General
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "core: open quickfix list" })
vim.keymap.set("n", "<leader>s", ":wa<CR>", { desc = "core: write to all open buffers" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "core: quit without saving" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "core: clear search highlights" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "core: open quickfix list" })

-- Splits
vim.keymap.set("n", "<C-w>-", "<C-w>s", { desc = "core: horizontal split" })
vim.keymap.set("n", "<C-w>/", "<C-w>v", { desc = "core: vertical split" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "core: move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "core: move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "core: move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "core: move focus to the upper window" })
