require('config.keybinds')
require('config.lazy')
require('config.lualine')

-----[THEME SETUP]-----
vim.cmd.colorscheme("vague")

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
vim.opt.smartindent = true
vim.opt.autoindent = true

-- git sign on the left side of the number line
vim.opt.signcolumn = "yes"

-- number line 
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Creates properly indented new lines between matching pairs
vim.keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

-- file saving with ctrl+s
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

-- disabled W/E like signs on the left side of the number line
vim.diagnostic.config({
  signs = false,
})

-- 3 sec timout for the update/save message below the lualine
vim.opt.showmode = false
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
})

-- showing git changes column only at the changes otherwise turned off
vim.opt.signcolumn = "auto"

-- disabled underline
vim.diagnostic.config({
  underline = false,
})
