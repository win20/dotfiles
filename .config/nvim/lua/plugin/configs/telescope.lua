return function()
  local telescope = require "telescope"
  local actions = require "telescope.actions"
  local builtin = require "telescope.builtin"

  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<c-enter>"] = "to_fuzzy_refine",
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
    pickers = {},
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  }

  -- Load extensions
  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "ui-select")

  -- Keymaps
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
  vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
  vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
  vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope recent files" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
  vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
  vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
  vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
  vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = "[/] Fuzzily search in current buffer" })

  -- Shortcut for searching your Neovim configuration files
  vim.keymap.set("n", "<leader>fn", function()
    builtin.find_files { cwd = vim.fn.stdpath "config" }
  end, { desc = "[S]earch [N]eovim files" })
end
