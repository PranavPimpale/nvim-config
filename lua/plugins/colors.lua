local function enable_transparency()
  vim.api.nvim_set_hl(0, "normal", { bg = "none" })
end
return {
  {
    "folke/tokyonight.nvim",
    config = function()
      --enable_transparency()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = 'tokyonight',
    }
  },
  {
    "kdheepak/monochrome.nvim",
  },
  {
     "thepogsupreme/mountain.nvim",
    lazy = false,
    priority = 100,
    config = function()
      vim.cmd.colorscheme("mountain")
    end,
  },
}
