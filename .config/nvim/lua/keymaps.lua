local map = vim.keymap.set

-- Vim --
map("i", "jk", "<ESC>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>s", ":wa<CR>")
map("n", "<leader>q", ":wq<CR>")
map("n", "<leader>Q", ":q!<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>z", ":noh<CR>", { desc = "Remove all hightlights in current buffer" })
map("n", "<leader>w", ":tabclose<CR>", { desc = "Close the current tab page" })

-- Splits --
map("n", "<leader>-", ":split<CR>")
map("n", "<leader>\\", ":vsplit<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Fuzzy finding with fzf --
local fzf = require("telescope.builtin")
map("n", "<leader>ff", fzf.find_files, { desc = "Telescope find files" })
map("n", "<leader>f", fzf.live_grep, { desc = "Telescope live grep" })
map("n", "<leader><leader>", fzf.buffers, { desc = "Telescope buffers" })
map("n", "<leader>?", fzf.oldfiles, { desc = "Telescope recent files" })

-- Git --
map("n", "<leader>G", ":Git<CR>", { desc = "Get current git status" })
map("n", "<leader>GU", ":Git push<CR>", { desc = "Get current git status" })

-- Harpoon --
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
map("n", "<leader>a", harpoon_mark.add_file, { desc = "Add file to harpoon" })
map("n", "<leader>h", harpoon_ui.toggle_quick_menu, { desc = "Show harpoon menu" })
map("n", "<leader>j", harpoon_ui.nav_prev, { desc = "Previous harpoon file" })
map("n", "<leader>k", harpoon_ui.nav_next, { desc = "Next harpoon file" })

-- Oil --
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent folder with oil.nvim" })

-- LSP --
map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open parent folder with oil.nvim" })
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "<leader>gr", vim.lsp.buf.references, {})
map("n", "<leader>gf", vim.lsp.buf.format, {})
map("n", "<space>rn", vim.lsp.buf.rename, {})
