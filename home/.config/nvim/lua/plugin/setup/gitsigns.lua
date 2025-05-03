-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function bufmap(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        bufmap("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk "next"
          end
        end, { desc = "gitsigns: jump to next git change" })

        bufmap("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "gitsigns: jump to previous git change" })

        -- Keymaps
        bufmap("v", "<leader>hs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "gitsigns: git stage hunk" })
        bufmap("v", "<leader>hr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "gitsigns: reset hunk" })
        -- normal mode
        bufmap("n", "<leader>hs", gitsigns.stage_hunk, { desc = "gitsigns: stage hunk" })
        bufmap("n", "<leader>hr", gitsigns.reset_hunk, { desc = "gitsigns: reset hunk" })
        bufmap("n", "<leader>hS", gitsigns.stage_buffer, { desc = "gitsigns: stage buffer" })
        bufmap("n", "<leader>hu", gitsigns.stage_hunk, { desc = "gitsigns: undo stage hunk" })
        bufmap("n", "<leader>hR", gitsigns.reset_buffer, { desc = "gitsigns: reset buffer" })
        bufmap("n", "<leader>hp", gitsigns.preview_hunk, { desc = "gitsigns: preview hunk" })
        bufmap("n", "<leader>hb", gitsigns.blame_line, { desc = "gitsigns: blame line" })
        bufmap("n", "<leader>hd", gitsigns.diffthis, { desc = "gitsigns: diff against index" })
        bufmap("n", "<leader>hD", function()
          gitsigns.diffthis "@"
        end, { desc = "gitsigns: diff against last commit" })
      end,
    },
  },
}
