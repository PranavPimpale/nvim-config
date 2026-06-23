return {
  "smoka7/hop.nvim",
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
