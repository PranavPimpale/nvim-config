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
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 100,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require('vague').setup({
        transparent = false, -- If true, background is not set
        bold = false, -- Disable bold globally
        italic = false, -- Disable italic globally
        on_highlights = function(hl, colors) end,
        colors = {
          bg = '#141415',
          inactiveBg = '#1c1c24',
          fg = '#cdcdcd',
          floatBorder = '#878787',
          line = '#222021',
          comment = '#606079',
          builtin = '#b4d4cf',
          func = '#c48282',
          string = '#9DC183',
          number = '#e0a363',
          property = '#c3c3d5',
          constant = '#aeaed1',
          parameter = '#bb9dbd',
          --visual = '#B388FF',
          error = '#FF2400',
          warning = '#f3be7c',
          hint = '#7e98e8',
          operator = '#90a0b5',
          keyword = '#6e94b2',
          type = '#9bb4bc',
          search = '#405065',
          plus = '#7fa563',
          delta = '#f3be7c',
        },
      })
    end,
  },
}
