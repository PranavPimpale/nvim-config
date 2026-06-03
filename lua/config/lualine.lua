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
    a = { fg = colors.white, bg = colors.grey },
    b = { fg = colors.red, bg = colors.grey },
    c = { fg = colors.white },

    x = { fg = colors.white, bg = colors.grey },
  },

  insert = {
    b = { fg = colors.green, bg = colors.grey },
  },

  visual = {
    b = { fg = colors.blue, bg = colors.grey },
  },

  command = {
    b = { fg = colors.blue, bg = colors.grey, gui = "bold" }, -- Blue
  },

  replace = {
    b = { fg = colors.white, bg = colors.grey },
  },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.violet, bg = colors.black },
    c = { fg = colors.white },
  },
}

require("lualine").setup({
  options = {
    theme = bubbles_theme,
    globalstatus = true,

    component_separators = "",
    section_separators = "",

    disabled_filetypes = {
      statusline = { "NvimTree" },
    },
  },

  sections = {
    lualine_a = {},

    lualine_b = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1):upper()
        end,
      },
    },

    lualine_c = {
      {
        "filename",
        path = 0,
      },
    },

    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        update_in_insert = true,

        sections = { "error", "warn" },

        symbols = {
          error = "",
          warn  = "",
        },

        diagnostics_color = {
          error = { fg = "#ff5555" },
          warn  = { fg = "#f1fa8c" },
        },
      },
    },

    lualine_y = {
      "",
    },

    lualine_z = {
      {
        "branch",
      },
    },
  },

  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  extensions = {},
})
