-- .config/nvim/lua/config/keybinds.lua

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

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

-- Creates properly indented new lines between matching pairs
vim.keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

-- file saving with ctrl+s
vim.keymap.set({ "n", "v" }, "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

-- yank/paste to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true, desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard" })

-- replacing <Esc> with Ctrl+s
vim.keymap.set({ "i", "v", "s" }, "<C-s>", "<Esc>", { noremap = true, silent = true })

-- Noice Enable/Disable keybinds
local noice_enabled = true

vim.keymap.set("n", "<leader>[", function()
  if noice_enabled then
    vim.cmd("NoiceDisable")
    noice_enabled = false
  else
    vim.cmd("NoiceEnable")
    noice_enabled = true
  end
end, { desc = "Toggle Noice" })
