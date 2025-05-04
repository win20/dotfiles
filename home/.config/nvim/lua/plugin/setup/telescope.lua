local function get_current_directory()
  local current_path = vim.fn.expand "%:p:h"
  local cleaned_path = current_path:gsub("^oil://", "")

  return cleaned_path
end

local function find_input_directory()
  local dir_name = vim.fn.input "Directory to search: "
  if dir_name == "" then
    vim.notify("No directory entered.", vim.log.levels.WARN)
    return
  end

  local matches = vim.fn.glob(dir_name, false, true)
  if #matches == 0 then
    matches = vim.fn.glob("**/" .. dir_name, false, true)
  end

  if #matches == 0 then
    vim.notify("Directory not found: " .. dir_name, vim.log.levels.ERROR)
    return
  end

  local dir_path = matches[1]
  if vim.fn.isdirectory(dir_path) == 0 then
    vim.notify("Not a directory: " .. dir_path, vim.log.levels.ERROR)
    return
  end

  return dir_path
end

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
        border = true,
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
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope: find files" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "telescope: live grep" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "telescope: open buffers" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "telescope: recent files" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope: help" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "telescope: keymaps" })
    vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "telescope: pickers" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "telescope: current word" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "telescope: diagnostics" })
    vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "telescope: git modified files" })
    vim.keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "telescope: git branches" })
    vim.keymap.set("n", "<leader>f/", function()
      builtin.lsp_document_symbols { symbols = { "Function", "Method", "Constant" } }
    end, { desc = "telescope: symbols in current buffer" })
    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "telescope: fzf in current buffer" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "telescope: neovim files" })

    vim.keymap.set("n", "<leader>FF", function()
      local cleaned_path = get_current_directory()
      vim.notify("Current working directory: " .. cleaned_path)

      builtin.find_files { search_dirs = { cleaned_path } }
    end, { desc = "telescope: files within a directory" })

    vim.keymap.set("n", "<leader>FS", function()
      local cleaned_path = get_current_directory()
      vim.notify("Current working directory: " .. cleaned_path)

      builtin.live_grep { search_dirs = { cleaned_path } }
    end, { desc = "telescope: grep within a directory" })

    vim.keymap.set("n", "<leader>DD", function()
      local dir_path = find_input_directory()
      builtin.find_files { search_dirs = { dir_path } }
    end, { desc = "telescope: files within an input directory" })

    vim.keymap.set("n", "<leader>DS", function()
      local dir_path = find_input_directory()
      builtin.find_files { search_dirs = { dir_path } }
    end, { desc = "telescope: grep within an input directory" })
  end,
}
