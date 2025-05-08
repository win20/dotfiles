return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  config = function()
    local oil = require "oil"
    oil.setup {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return vim.startswith(name, "..") or name == ".DS_Store"
        end,
      },
      keymaps = {
        ["q"] = "actions.close",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
      },
    }

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "oil: open directory" })

    vim.keymap.set("n", "<leader>qq", function()
      vim.cmd "bd"
      oil.open(vim.fn.getcwd())
    end)
  end,
}
