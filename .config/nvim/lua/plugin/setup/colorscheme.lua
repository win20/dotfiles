local colorschemes = {
  black_metal_dark_funeral = {
    base00 = "#000000",
    base01 = "#121212",
    base02 = "#222222",
    base03 = "#444444", -- comments
    base04 = "#999999",
    base05 = "#c1c1c1",
    base06 = "#999999",
    base07 = "#c1c1c1",
    base08 = "#5f8787",
    base09 = "#aaaaaa",
    base0A = "#5f81a5",
    base0B = "#d0dfee",
    base0C = "#aaaaaa",
    base0D = "#888888",
    base0E = "#999999",
    base0F = "#444444",
  },
}

return {
  "RRethy/base16-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- local colorscheme = colorschemes.black_metal_dark_funeral
    require("base16-colorscheme").setup(colorschemes.black_metal_dark_funeral)
  end,
}
