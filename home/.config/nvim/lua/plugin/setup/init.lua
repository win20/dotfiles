return {
  "tpope/vim-sleuth",

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "imsnif/kdl.vim",
    ft = { "kdl" },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>to",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "trouble: buffer diagnostics",
      },
      {
        "<leader>t/",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "trouble: buffer symbols",
      },
    },
  },
}
