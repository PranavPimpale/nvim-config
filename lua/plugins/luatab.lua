return {
  {
    "alvarosevilla95/luatab.nvim",

    config = function()
      require("luatab").setup({
        windowCount = function()
          return ""
        end,
        devicon = function()
          return ""
        end,
      })

      vim.diagnostic.config({
        update_in_insert = true,
      })

      vim.api.nvim_create_autocmd({
        "DiagnosticChanged",
        "TextChanged",
        "TextChangedI",
      }, {
        callback = function()
          vim.cmd("redrawtabline")
        end,
      })
    end,
  },
}
