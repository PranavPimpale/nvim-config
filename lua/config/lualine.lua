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
    a = { fg = colors.red, bg = colors.grey, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },

    x = { fg = colors.white, bg = colors.grey },
  },

  insert = {
    a = { fg = colors.blue, bg = colors.grey, gui = "bold" },
  },

  visual = {
    a = { fg = colors.cyan, bg = colors.grey, gui = "bold" },
  },

  command = {
    a = { fg = colors.green, bg = colors.grey, gui = "bold" },
  },

  replace = {
    a = { fg = colors.white, bg = colors.grey, gui = "bold"},
  },

  inactive = {
    a = { fg = colors.violet, bg = colors.black, gui = "bold" },
    b = { fg = colors.white, bg = colors.black },
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
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1):upper()
        end,
      },
    },

    lualine_b = {
      {
        "filename",
        path = 0,
        color = {
          bg = "#191919",
        },
      },
    },

    lualine_c = {
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

        color = {
          bg = "#191919";
        },
      },
    },

    lualine_x = {
      {
        function()
          local date = tostring(os.date("%d %b")):gsub("^0", ""):lower()
          local time = tostring(os.date("%I:%M %p")):gsub("^0", ""):lower()

          return string.format("%s | %s", date, time)
        end,

        color = {
          fg = "#aeb5b7",
          bg = "#191919",
        },
      },
    },

    lualine_y = {
      {
        "branch",
        color = {
          fg = colors.white,
          bg = "#272727",
        }
      },
    },

    lualine_z = {},
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
