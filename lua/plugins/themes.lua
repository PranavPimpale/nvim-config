local colors = require('config.colors')

return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require('vague').setup({
        transparent = true,
        bold = false,
        italic = false,
        on_highlights = function(hl, color)
          -- disables the ~ from the remaining lines (dont change anything)
          hl.EndOfBuffer = {
            fg = color.bg,
          }
          hl.MatchParen = {
            fg = "#E55451",
            bg = "#232323",
            bold = true,
          }
        end,
        colors = {
          bg = colors.bg,
          inactiveBg = colors.inactiveBg,
          fg = colors.fg,
          floatBorder = colors.floatBorder,
          line = colors.line,
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
          search = colors.search,
          plus = colors.plus,
          delta = colors.delta,
        },
      })

      -- set theme
      vim.cmd.colorscheme("vague")

      -- custom select highlights
      vim.api.nvim_set_hl(0, "Search", {
        bg = "#303030",
      })

      vim.api.nvim_set_hl(0, "IncSearch", {
        bg = "#505050",
      })
    end,
  },

  --[[ theme : Mountain {
    "thepogsupreme/mountain.nvim",
    lazy = false,
    priority = 100,
    config = function()
    end,
  },]]--

  --[[ theme : nightfox {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 100,
  },]]--
}
