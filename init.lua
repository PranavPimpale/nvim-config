require('config.options')
require('config.keybinds')
require('config.lazy')
require('config.lualine')

-----[THEME SETUP]-----
vim.cmd.colorscheme("vague")

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
vim.opt.signcolumn = "yes" -- git changes indicator "not imp still enabled from here"

vim.keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

local map = vim.keymap.set

-- file saving with ctrl+s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

--[[ this fixed the tab issue but i used another method to tackle the issue
vim.keymap.del({ "i", "s" }, "<Tab>")]]--

vim.diagnostic.config({
  signs = false,
})

-- switching between nvim-tree and buffer
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- switching between buffer tabs 
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- Insert mode cursor movement with Ctrl + h/j/k/l
vim.keymap.set('i', '<C-h>', '<Left>',  { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<Down>',  { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Up>',    { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })

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
