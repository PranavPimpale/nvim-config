return {
  'nvim-treesitter/nvim-treesitter',
  -- Use the main branch if you aren't already
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      ensure_installed = {
        "lua",
        "c",
        "cpp",
        "python",
      }
    })
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}
