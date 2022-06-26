-- Set up file explorer icons
require'nvim-web-devicons'.setup {}
require'nvim-web-devicons'.get_icons()

-- Set up color
require'colorizer'.setup{}

vim.g.colors_name = "nvb-everforest"

require("appearance.colorscheme").setup {
  base00 = "#2b3339",
  base01 = "#323c41",
  base02 = "#503946",
  base03 = "#868d80",
  base04 = "#d3c6aa",
  base05 = "#d3c6aa",
  base06 = "#e9e8d2",
  base07 = "#fff9e8",
  base08 = "#7fbbb3",
  base09 = "#d699b6",
  base0A = "#83c092",
  base0B = "#dbbc7f",
  base0C = "#e69875",
  base0D = "#a7c080",
  base0E = "#e67e80",
  base0F = "#d699b6",
}

-- Set up status bar
require'lualine'.setup{
  options = {
  theme = 'gruvbox_dark',
  },
}