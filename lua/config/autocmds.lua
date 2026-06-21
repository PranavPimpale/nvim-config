local api = vim.api

-- 4 spaced tab for c/cpp
api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- 4 spaced tab for lua/py
api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "html", "javascript", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- format after save
api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("silent! normal! gg=G")
    vim.fn.winrestview(view)
  end,
})

-- notify on save (plugins -> notify)
api.nvim_create_autocmd("BufWritePost", {
  callback = function(args)
    vim.notify(
      " Saved:" .. vim.fn.fnamemodify(args.file, ":t") .. " ",
      vim.log.levels.INFO,
      {}
    )
  end,
})

api.nvim_create_autocmd("ColorScheme", {

  callback = function()
    -- lualine color set for blank space between section-c and section-x
    api.nvim_set_hl(0, "StatusLine", {
      fg = "#dddddd",
      bg = "#171717",
    })

    -- code suggestions floating window border colors settings
    api.nvim_set_hl(0, "FloatBorder", {
      fg = "#dddddd",
      bg = "#090909",-- set the same color to the themes bg color code
    })

    api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {
      fg = "#373737",
      strikethrough = false,
    })
  end,
})
