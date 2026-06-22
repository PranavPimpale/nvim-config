local plugins = require("config.plugins")

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = plugins.blankline,
    main = "ibl",
    --@module "ibl"
    --@type ibl.config
    opts = {},
    config = function()
      local highlight = {
        "DarkBlue",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "DarkBlue", {
          fg = "#272727",
          bg = "NONE",
          nocombine = true,
        })
      end)

      require("ibl").setup {
        indent = { highlight = highlight, char = "│",},
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          enabled = true,
          -- to disable function underlines
          show_start = false,
          show_end = false,
        },
      }
    end,
  },
}
