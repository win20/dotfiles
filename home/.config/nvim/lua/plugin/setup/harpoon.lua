return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup()

    vim.keymap.set("n", "<leader>ma", function()
      harpoon:list():add()
    end, { desc = "harpoon: add mark" })

    vim.keymap.set("n", "<leader>mm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "harpoon: open menu" })
    vim.keymap.set("n", "<leader>j", function()
      harpoon:list():prev()
    end, { desc = "harpoon: previous file" })
    vim.keymap.set("n", "<leader>k", function()
      harpoon:list():next()
    end, { desc = "harpoon: next file" })
  end,
}
