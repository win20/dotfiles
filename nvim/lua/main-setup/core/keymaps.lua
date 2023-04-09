vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>s", ":wa<CR>")
keymap.set("n", "<leader>q", ":wq<CR>")
keymap.set("n", "<leader>k", ":bnext<CR>")
keymap.set("n", "<leader>j", ":bprev<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>|", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>xx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Git fugitive
-- keymap.set("n", "<leader>g", ":G<CR>")
keymap.set("n", "<leader>gaa", ":G add")
keymap.set("n", "<leader>ga", ":G add .<CR>")
--keymap.set("n", "<leader>gc", ":G commit<CR>")
keymap.set("n", "<leader>gd", ":G pull<CR>")
keymap.set("n", "<leader>gu", ":G push<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>b", "<cmd>lua require('telescope.builtin').git_branches()<cr>") -- list buffers
keymap.set("n", "<leader>r", "<cmd>lua require('telescope.builtin').oldfiles()<cr>") -- recent files
keymap.set("n", "<leader>7", "<cmd>lua require('telescope.builtin').treesitter()<cr>") -- recent files
keymap.set("n", "<leader>1", "<cmd>lua require('telescope.builtin').lsp_references()<cr>") -- list references of word under cursor

-- Comment
local api = require("Comment.api")
local config = require("Comment.config"):get()

keymap.set("n", "<leader>/", api.toggle.linewise.current)
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
-- Toggle selection (blockwise)
keymap.set("x", "<leader>/", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.linewise(vim.fn.visualmode())
end)

-- Trouble
keymap.set("n", "<leader>2", "<cmd>TroubleToggle<cr>") -- diagnostics
