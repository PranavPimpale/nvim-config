return {
  {
    "thepogsupreme/mountain.nvim",
    lazy = false,
    priority = 100,
    config = function()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 100,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require('vague').setup({
        transparent = false,
        bold = false,
        italic = false,
        on_highlights = function(hl, colors)
          hl.EndOfBuffer = {
            fg = colors.bg,
          }
          hl.MatchParen = {
            fg = "#E55451",
            bg = "#232323",
            bold = true,
          }
        end,
        colors = {
          bg = '#101010',
          inactiveBg = '#1c1c24',
          fg = '#cdcdcd',
          floatBorder = '#878787',
          line = '#171717',
          comment = '#606079',
          builtin = '#b4d4cf',
          func = '#F78C6C',
          string = '#9DC183',
          number = '#e0a363',
          property = '#c3c3d5',
          constant = '#aeaed1',
          parameter = '#bb9dbd',
          --visual = '#B388FF',
          error = '#f94449',
          warning = '#f3be7c',
          hint = '#7e98e8',
          operator = '#90a0b5',
          keyword = '#6e94b2',
          type = '#9bb4bc',
          search = '#405065',
          plus = '#7fa563',
          delta = '#f3be7c',
        },
      })
    end,
  },
}
