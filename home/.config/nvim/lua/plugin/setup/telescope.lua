return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },

  config = function()
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
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search keymaps" })
    vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "Search select telescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Search current word" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search diagnostics" })
    vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "Search git modified files" })
    vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "Search git branches" })
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
    end, { desc = "Search neovim files" })

    vim.keymap.set("n", "<leader>FF", function()
      local current_path = vim.fn.expand "%:p:h"
      local cleaned_path = current_path:gsub("^oil://", "")
      vim.notify("Current working directory: " .. cleaned_path)

      builtin.find_files { search_dirs = { cleaned_path } }
    end, { desc = "Search files within a directory" })

    vim.keymap.set("n", "<leader>FS", function()
      local current_path = vim.fn.expand "%:p:h"
      local cleaned_path = current_path:gsub("^oil://", "")
      vim.notify("Current working directory: " .. cleaned_path)

      builtin.live_grep { search_dirs = { cleaned_path } }
    end, { desc = "Live grep within a directory" })
  end,
}
