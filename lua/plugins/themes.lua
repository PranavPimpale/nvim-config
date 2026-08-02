local plugins = require('config.plugins')
local colors = require('config.colors')

return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require('vague').setup({
        bold = false,
        italic = false,
        colors = {
          bg = colors.bg,
          inactiveBg = colors.inactiveBg,
          fg = colors.fg,
          floatBorder = colors.floatBorder,
          comment = colors.comment,
          builtin = colors.builtin,
          func = colors.func,
          string = colors.string,
          number = colors.number,
          property = colors.property,
          constant = colors.constant,
          parameter = colors.parameter,
          --visual = colors.visual,
          error = colors.error,
          warning = colors.warning,
          hint = colors.hint,
          operator = colors.operator,
          keyword = colors.keyword,
          type = colors.type,
          plus = colors.plus,
          delta = colors.delta,
        },
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        statementStyle = { bold = false },
        keywordStyle   = { italic = false },
        commentStyle   = { italic = false },
        functionStyle  = { bold = false },
        typeStyle      = { bold = false },

        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end,
  },

  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        italic = false,
        bold = false,
      })
    end,
  },

  {
    'brenoprata10/nvim-highlight-colors',
    enabled = plugins.highlight,
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
}
