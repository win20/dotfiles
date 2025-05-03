return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add file to harpoon" })
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Show harpoon menu" })
    vim.keymap.set("n", "<leader>j", function()
      harpoon:list():prev()
    end, { desc = "Previous harpoon file" })
    vim.keymap.set("n", "<leader>k", function()
      harpoon:list():next()
    end, { desc = "Next harpoon file" })
  end,
}
