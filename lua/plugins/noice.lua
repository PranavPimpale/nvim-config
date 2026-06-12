return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      enabled = true,
      format = {
        cmdline = {
          icon = ":",
        },
        search_down = {
          icon = "/",
        },
        search_up = {
          icon = "?",
        },
        lua = {
          icon = ":",
        },
      },
    },

    views = {
      cmdline_popup = {
        position = {
          row = "95%",
          col = "50%",
        },
        size = {
          width = "80%",   -- make smaller
          height = "auto",
        },
        border = {
          style = "rounded",
        },
      },
    },
  },
}
