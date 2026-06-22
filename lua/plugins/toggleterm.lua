local plugins = require("config.plugins")

return {
  "akinsho/toggleterm.nvim",
  enabled = plugins.toggleterm,
  version = "*",

  config = function()
    require("toggleterm").setup({
      start_in_insert = true,
      direction = "float",

      float_opts = {
        border = "rounded",
        width = 60,
        height = 13,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local term = nil

    vim.keymap.set({ "n", "t" }, "<leader>d", function()
      if term and term:is_open() then
        term:shutdown()
        term = nil
        return
      end

      local dir = vim.fn.expand("%:p:h")

      term = Terminal:new({
        dir = dir,
        direction = "float",
        hidden = true,
        close_on_exit = true,
      })

      term:open()

      vim.defer_fn(function()
        vim.cmd("startinsert")
      end, 20)
    end, { silent = true })
  end,
}
