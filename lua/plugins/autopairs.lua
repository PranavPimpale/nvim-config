local toggle = require('loader.toggle')

return {
  {
    "windwp/nvim-autopairs",
    enabled = toggle.autopairs,
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  },
}
