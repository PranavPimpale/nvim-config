local plugins = require("config.plugins")
local colors = require('config.colors')

return {
  'nvim-lualine/lualine.nvim',
  enabled = plugins.lualine,
  event = "UIEnter",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function ()
    local bubbles_theme = {
      normal = {
        a = { fg = colors.red, bg = colors.dark, gui = "bold" },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },

        x = { fg = colors.white, bg = colors.grey },
      },

      insert = {
        a = { fg = colors.blue, bg = colors.dark, gui = "bold" },
      },

      visual = {
        a = { fg = colors.cyan, bg = colors.dark, gui = "bold" },
      },

      command = {
        a = { fg = colors.green, bg = colors.dark, gui = "bold" },
      },

      replace = {
        a = { fg = colors.white, bg = colors.dark, gui = "bold"},
      },

      inactive = {
        a = { fg = colors.violet, bg = colors.dark, gui = "bold" },
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
              bg = colors.black,
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
              error = { fg = colors.cherry },
              warn  = { fg = colors.yellow },
            },

            color = {
              bg = colors.black;
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
              fg = colors.white,
              bg = colors.black,
            },
          },
        },

        lualine_y = {
          {
            "branch",
            color = {
              fg = colors.white,
              bg = colors.dark,
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
  end
}
