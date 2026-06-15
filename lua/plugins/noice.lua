return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },

      hover = {
        enabled = false,
      },

      signature = {
        enabled = false,
      },

      message = {
        enabled = false,
      },
    },

    cmdline = {
      enabled = true,
      format = {
        cmdline = { icon = ":" },
        search_down = { icon = "/" },
        search_up = { icon = "?" },
        lua = { icon = ":" },
      },
    },

    popupmenu = {
      enabled = true,
    },

    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },

    views = {
      cmdline_popup = {
        position = {
          row = "90%",
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
