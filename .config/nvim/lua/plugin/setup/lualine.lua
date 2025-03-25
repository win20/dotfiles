return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local ayu_mirage = require "lualine.themes.ayu_mirage"
    ayu_mirage.normal.a.bg = "#000000"
    ayu_mirage.normal.b.bg = "#000000"
    ayu_mirage.normal.c.bg = "#000000"

    ayu_mirage.insert.a.bg = "#000000"
    ayu_mirage.insert.b.bg = "#000000"

    ayu_mirage.visual.a.bg = "#000000"
    ayu_mirage.visual.b.bg = "#000000"

    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = ayu_mirage,
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "diagnostics" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
