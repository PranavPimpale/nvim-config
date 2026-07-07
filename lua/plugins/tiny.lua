local colors = require('config.colors')

return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "minimal",

        transparent_bg = false,
        transparent_cursorline = true,

        options = {
          show_source = true,
          use_icons_from_diagnostic = false,
          multilines = {
            enabled = true,
            always_show = false,
          },
        },
      })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
      end)

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
      end)

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

      vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = colors.bg,
      })

      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = colors.white,
        bg = colors.bg,
      })

      -- Disable Neovim's built-in inline text
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        severity_sort = true,
        update_in_insert = false,
        float = {
          border = "single",
          source = "if_many",
        },
      })
    end,
  },
}
