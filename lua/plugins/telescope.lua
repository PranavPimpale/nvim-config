local plugins = require('config.plugins')

return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    enabled = plugins.telescope,
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files(
          require("telescope.themes").get_dropdown({
            previewer = false,
            layout_config = {
              width = 0.6,
              height = 0.7,
            },
            selection_caret = "➜ ",
          })
        )
      end)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set("n", "<leader>fb", function()
        require("telescope.builtin").buffers(
          require("telescope.themes").get_dropdown({
            previewer = false,
            layout_config = {
              width = 0.7,
              height = 0.7,
            },
          })
        )
      end)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  }
}
