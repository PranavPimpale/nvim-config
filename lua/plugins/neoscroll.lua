local plugins = require('config.plugins')

return {
  "karb94/neoscroll.nvim",
  enabled = plugins.neoscroll,
  event = "WinScrolled",

  opts = {
    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    duration_multiplier = 0.7,
    easing = "quadratic",
  },

  config = function(_, opts)
    local neoscroll = require("neoscroll")

    neoscroll.setup(opts)

    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 100, easing = "sine" })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 100, easing = "sine" })
      end,
      ["<C-b>"] = function()
        neoscroll.ctrl_b({ duration = 100, easing = "circular" })
      end,
      ["<C-f>"] = function()
        neoscroll.ctrl_f({ duration = 100, easing = "circular" })
      end,
      ["<C-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<C-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
    }

    local modes = { "n", "v", "x" }

    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
