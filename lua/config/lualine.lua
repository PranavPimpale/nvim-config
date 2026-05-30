-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#f94449',
  violet = '#d183e8',
  grey   = '#303030',
  green  = '#72bf6a',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.red, bg = colors.grey },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.green, bg = colors.grey } },
  visual = { a = { fg = colors.blue, bg = colors.grey } },
  replace = { a = { fg = colors.white, bg = colors.grey } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', '' },
    lualine_z = {
      { 
        'diagnostics', 
        update_in_insert = true,

        symbols = {
          error = "E:",
          warn  = "W:",
          info  = "I:",
          hint  = "H:",
        },

        diagnostics_color = {
          error = { fg = "#ff5555" },
          warn  = { fg = "#f1fa8c" },
          info  = { fg = "#8be9fd" },
          hint  = { fg = "#50fa7b" },
        },

        separator = { left = '' }, 
        left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'location'},
    },
    tabline = {},
    extensions = {},
  }
