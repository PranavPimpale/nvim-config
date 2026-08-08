local toggle = require('loader.toggle')

return {
  "echasnovski/mini.files",
  enabled = toggle.files,
  version = "*",
  config = function()
    local MiniFiles = require("mini.files")

    MiniFiles.setup({
      windows = {
        preview = false,
        width_focus = 25,
        width_nofocus = 17,
      },
      mappings = {
        close = "q",
        go_in = "l",
        go_out = "h",
        go_in_plus = "<CR>",
        go_out_plus = "H",
      },
    })

    vim.keymap.set("n", "<leader>a", function()
      if MiniFiles.get_explorer_state() then
        MiniFiles.close()
      else
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end
    end)

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionOpen",
      callback = function()
        vim.schedule(function()
          MiniFiles.close()
        end)
      end,
    })
  end,
}
