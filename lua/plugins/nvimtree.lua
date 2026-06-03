return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("nvim-tree").setup({
      -- thickness for the tree
      view = {
        width = 26,
      },

      -- closing the window after opening a file 
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      -- current folder on the top of the nvim tree
      renderer = {
        root_folder_label = function(path)
          local parent = vim.fn.fnamemodify(path, ":h:t")
          local current = vim.fn.fnamemodify(path, ":t")

          return parent .. "/" .. current
        end,
      },
    })

    -- nvim tree toggle key map
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {
      noremap = true,
      silent = true,
    })

    -- cursor behaviour while scrolling through the tree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function()
        vim.keymap.set("n", "j", "j^", { buffer = true, remap = true })
        vim.keymap.set("n", "k", "k^", { buffer = true, remap = true })
      end,
    })
  end,
}
