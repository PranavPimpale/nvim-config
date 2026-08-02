local plugins = require('loader.plugins')

return {
  {
    "windwp/nvim-autopairs",
    enabled = plugins.autopairs,
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  },
}
