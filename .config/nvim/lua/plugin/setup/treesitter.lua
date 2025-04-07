return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- main = "nvim-treesitter.configs",
  config = function()
    vim.filetype.add {
      extension = {
        kdl = "kdl",
      },
    }
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "kdl",

        "typescript",
        "javascript",
        "tsx",
        "python",
        "go",
        "php",
        "astro",
        "css",
        "scss",
        "json",
        "yaml",

        "regex",
        "jsdoc",
        "comment",
        "dockerfile",
        "gitignore",
        "graphql",
        "http",
        "sql",
        "toml",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
      -- Add these additional modules for better experience
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        enable = true,
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.outer",
            ["aC"] = "@comment.outer",
            ["iC"] = "@comment.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
            ["]l"] = "@loop.outer",
            ["]i"] = "@conditional.outer",
            ["]b"] = "@block.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
            ["[l"] = "@loop.outer",
            ["[i"] = "@conditional.outer",
            ["[b"] = "@block.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Add this for textobjects support
  },
}
