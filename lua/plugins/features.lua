return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      start_in_insert = true,
      direction = "float",

      float_opts = {
        border = "rounded",
        width = 70,
        height = 18,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local term = nil

    vim.keymap.set({ "n", "t" }, "<C-t>", function()
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
