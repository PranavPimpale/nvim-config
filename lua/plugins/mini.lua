local plugins = require('config.plugins')

return {
  "echasnovski/mini.indentscope",
  enabled = plugins.mini,
  version = false,
  event = "VeryLazy",
  opts = {
    symbol = "│",
  },
  config = function(_, opts)
    require("mini.indentscope").setup(opts)

    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
      fg = '#aaaaaa',
      bold = false,
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.buftype ~= "" then
          vim.b.miniindentscope_disable = true
        end
      end,
    })
  end,
}
