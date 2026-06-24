local plugins = require('config.plugins')

return {
  "rcarriga/nvim-notify",
  enabled = plugins.notify,
  config = function()
    require("notify").setup({
      render = "minimal",
      timeout = 3000,
      stages = "fade",
      minimum_width = 0,
    })

    vim.notify = require("notify")
  end,
}
