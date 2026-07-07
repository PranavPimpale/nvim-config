local plugins = require('config.plugins')

return {
  {
    'brenoprata10/nvim-highlight-colors',
    enabled = plugins.highlight,
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
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
  {
    "lewis6991/gitsigns.nvim",
    enabled = plugins.gitsigns,
    opts = {},
  },
}
