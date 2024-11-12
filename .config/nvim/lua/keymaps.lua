local map = vim.keymap.set

-- Vim keymaps --
map("i", "jk", "<ESC>")
map("n", "<leader>e", ":Ex<CR>")
map('n', '<leader>s', ":wa<CR>")
map('n', '<leader>q', ":wq<CR>")
map('n', '<leader>Q', ":q!<CR>")
map('n', '<leader>e', ":Ex<CR>")
map("n", "<leader>c", ":noh<CR>", { desc = "Remove all hightlights in current buffer" })


-- Fuzzy finding with fzf --
local fzf = require("telescope.builtin")

map("n", "<leader>ff", fzf.find_files, { desc = "Telescope find files" })
map("n", "<leader>f", fzf.live_grep, { desc = "Telescope live grep" })
map("n", "<leader><leader>", fzf.buffers, { desc = "Telescope buffers" })
map("n", "<leader>?", fzf.oldfiles, { desc = "Telescope recent files" })

