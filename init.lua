require('config.options')
require('config.keybinds')
require('config.lazy')
require('config.lualine')

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

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

local map = vim.keymap.set

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

-- this fixed the tab issue but i used another method to tackle the issue
--vim.keymap.del({ "i", "s" }, "<Tab>")


--vim.cmd.colorscheme("monochrome")

vim.diagnostic.config({
  signs = false,
})
