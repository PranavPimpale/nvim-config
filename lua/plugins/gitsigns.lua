local plugins = require('config.plugins')

return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = plugins.gitsigns,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,

      watch_gitdir = {
        follow_files = true,
      },

      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
      },

      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
      },
    },

    keys = {
      { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Hunk" },
      { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Previous Hunk" },

      { "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
      { "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
      { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage" },
      { "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },

      { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
      { "<leader>hb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line" },
      { "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff This" },
      { "<leader>ht", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Blame" },
      { "<leader>hw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "Toggle Word Diff" },
    },
  },
}
