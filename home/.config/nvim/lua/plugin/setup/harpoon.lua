return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon_mark = require "harpoon.mark"
    local harpoon_ui = require "harpoon.ui"

    vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, { desc = "Add file to harpoon" })
    vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu, { desc = "Show harpoon menu" })
    vim.keymap.set("n", "<leader>j", harpoon_ui.nav_prev, { desc = "Previous harpoon file" })
    vim.keymap.set("n", "<leader>k", harpoon_ui.nav_next, { desc = "Next harpoon file" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        harpoon_ui.nav_file(i)
      end, {
        desc = "Navigate to file " .. i,
      })
    end
  end,
}
