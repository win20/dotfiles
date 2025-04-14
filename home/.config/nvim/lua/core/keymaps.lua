-- [[ Vim keymaps ]]
--  See `:help vim.keymap.set()`
--  Plugin specific keymaps are defined in their own configs

-- General
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>s", ":wa<CR>", { desc = "Write to all open buffers" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Splits
vim.keymap.set("n", "<C-w>-", "<C-w>s", { desc = "Create horizontal split" })
vim.keymap.set("n", "<C-w>/", "<C-w>v", { desc = "Create vertical split" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Oil --
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent folder with oil.nvim" })
