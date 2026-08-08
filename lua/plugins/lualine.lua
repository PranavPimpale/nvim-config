local toggle = require('loader.toggle')
local colors = require('loader.colors')

return {
  'nvim-lualine/lualine.nvim',
  enabled = toggle.lualine,
  event = "UIEnter",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function ()
    local common = {
      b = { fg = colors.white, bg = colors.grey },
      c = { fg = colors.white, bg = colors.black },
      x = { fg = colors.white, bg = colors.black },
      y = { fg = colors.white, bg = colors.dark },
      z = { fg = colors.white, bg = colors.dark },
    }

    local bubbles_theme = {
      normal = vim.tbl_extend("force", common, {
        a = { fg = colors.red, bg = colors.dark, gui = "bold" },
      }),

      insert = vim.tbl_extend("force", common, {
        a = { fg = colors.blue, bg = colors.dark, gui = "bold" },
      }),

      visual = vim.tbl_extend("force", common, {
        a = { fg = colors.cyan, bg = colors.dark, gui = "bold" },
      }),

      command = vim.tbl_extend("force", common, {
        a = { fg = colors.green, bg = colors.dark, gui = "bold" },
      }),

      replace = vim.tbl_extend("force", common, {
        a = { fg = colors.white, bg = colors.dark, gui = "bold" },
      }),

      terminal = vim.tbl_extend("force", common, {
        a = { fg = colors.violet, bg = colors.dark, gui = "bold" },
      }),

      inactive = vim.tbl_extend("force", common, {
        a = { fg = colors.violet, bg = colors.dark, gui = "bold" },
      }),
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

              return string.format("%s", date)
            end,

            color = {
              fg = colors.white,
              bg = colors.black,
            },
          },
        },

        lualine_y = {
          {
            function ()
              local time = tostring(os.date("%I:%M %p")):gsub("^0", ""):lower()

              return string.format("%s", time)
            end,

            color = {
              fg = colors.white,
              bg = colors.dark,
            },
          },
        },

        lualine_z = {
          {
            "branch",
            color = {
              fg = colors.white,
              bg = colors.dark,
            }
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
  end
}
