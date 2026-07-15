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
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
            },
            n = {
              ["<Tab>"] = actions.move_selection_next,
              ["<S-Tab>"] = actions.move_selection_previous,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      -- keymaps
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files(
          require("telescope.themes").get_dropdown({
            previewer = false,
            layout_config = {
              width = 0.6,
              height = 0.9,
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
            selection_caret = "➜ ",
          })
        )
      end)

      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      vim.keymap.set("n", "<leader>o", function()
        require("telescope.builtin").lsp_document_symbols(
          require("telescope.themes").get_dropdown({
            previewer = false,
            layout_config = {
              width = 0.6,
              height = 0.9,
            },
            selection_caret = "➜ ",
            symbols = { "Function", "Method" },
            show_line = false,
          })
        )
      end)
    end
  }
}
