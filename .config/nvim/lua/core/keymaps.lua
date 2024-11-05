local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'jk', "<ESC>")
vim.keymap.set('n', '<leader>s', ":wa<CR>")
vim.keymap.set('n', '<leader>q', ":wq<CR>")
vim.keymap.set('n', '<leader>e', ":Ex<CR>")
