require('config.keybinds')
require('config.lazy')
require('config.lualine')

-----[THEME SETUP]-----
vim.cmd.colorscheme("vague")

-- lualine color set for space between section-c and section-x
vim.api.nvim_set_hl(0, "StatusLine", {
  fg = "#dddddd",
  bg = "#191919",
})

-- code suggestion color adjustments
vim.api.nvim_set_hl(0, "FloatBorder", {
  fg = "#dddddd",
  bg = "#101010",
})

-- tabspaces according to the language
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- tab indentation
vim.opt.autoindent = true

-- git sign on the left side of the number line
vim.opt.signcolumn = "yes"

-- number line
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- disabled W/E like signs on the left side of the number line
vim.diagnostic.config({
  signs = false,
})

-- 3 sec timout for the update/save message below the lualine
--[[vim.opt.showmode = false
local group = vim.api.nvim_create_augroup("ClearMessages", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "ModeChanged" }, {
  group = group,
  callback = function()
    vim.defer_fn(function()
      if vim.api.nvim_get_mode().mode ~= "c" then
        vim.cmd("echo ''")
      end
    end, 3000) -- 3 seconds
  end,
})]]--

-- showing git changes column only at the changes otherwise turned off
vim.opt.signcolumn = "auto"

-- disabled underline
vim.diagnostic.config({
  underline = false,
})

-- dim deprecated suggestions
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {
      fg = "#373737",
      strikethrough = false,
    })
  end,
})

-- format after save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("silent! normal! gg=G")
    vim.fn.winrestview(view)
  end,
})

-- notify on save 
-- remove this after deleting plugins/notify.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(args)
    vim.notify(
      " Saved:" .. vim.fn.fnamemodify(args.file, ":t") .. " ",
      vim.log.levels.INFO,
      {}
    )
  end,
})
