return {
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup { n_lines = 500 }

    require("mini.surround").setup {
      mappings = {
        add = "",
        delete = "",
        replace = "",
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
        suffix_last = "",
        suffix_next = "",
      },
    }
    vim.keymap.set("n", "sa", "<cmd>lua MiniSurround.add()<CR>", { desc = "surround: add" })
    vim.keymap.set("n", "sd", "<cmd>lua MiniSurround.delete()<CR>", { desc = "surround: delete" })
    vim.keymap.set("n", "sf", "<cmd>lua MiniSurround.find()<CR>", { desc = "surround: find right" })
    vim.keymap.set("n", "sF", "<cmd>lua MiniSurround.find_left()<CR>", { desc = "surround: find left" })
    vim.keymap.set("n", "sh", "<cmd>lua MiniSurround.highlight()<CR>", { desc = "surround: highlight" })
    vim.keymap.set("n", "sr", "<cmd>lua MiniSurround.replace()<CR>", { desc = "surround: replace" })
    vim.keymap.set("n", "sn", "<cmd>lua MiniSurround.update_n_lines()<CR>", { desc = "surround: update n_lines" })

    require("mini.comment").setup {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    }
  end,
}
