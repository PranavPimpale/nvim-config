return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      render = "minimal",
      timeout = 3000,
      stages = "static",
    })

    vim.notify = require("notify")
  end,
}
