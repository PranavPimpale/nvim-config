local plugins = require('config.plugins')

return {
  "smoka7/hop.nvim",
  enabled = plugins.hop,
  version = "*",
  opts = {},
  keys = {
    {
      "f",
      function()
        require("hop").hint_words()
      end,
      desc = "Hop Words",
    },
    {
      "L",
      function()
        require("hop").hint_lines()
      end,
      desc = "Hop Lines",
    },
    {
      "t",
      function()
        require("hop").hint_char1()
      end,
      desc = "Hop char1",
    },
    {
      "T",
      function()
        require("hop").hint_char2()
      end,
      desc = "Hop char2",
    },
  },
}
