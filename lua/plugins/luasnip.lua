local plugins = require('loader.plugins')

return {
  "L3MON4D3/LuaSnip",
  enabled = plugins.luasnip,
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    })
  end,
}
