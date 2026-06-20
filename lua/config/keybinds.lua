local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- switching between nvim-tree and buffer
keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- switching between buffer tabs 
keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- Insert mode cursor movement with Ctrl/Alt + h/j/k/l
keymap.set('i', '<C-h>', '<Left>',  { noremap = true, silent = true })
keymap.set('i', '<C-j>', '<Down>',  { noremap = true, silent = true })
keymap.set('i', '<C-k>', '<Up>',    { noremap = true, silent = true })
keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })

keymap.set('i', '<A-h>', '<Left>',  { noremap = true, silent = true })
keymap.set('i', '<A-j>', '<Down>',  { noremap = true, silent = true })
keymap.set('i', '<A-k>', '<Up>',    { noremap = true, silent = true })
keymap.set('i', '<A-l>', '<Right>', { noremap = true, silent = true })

-- disabling arrow keys of keyboard in nvim
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")

keymap.set("i", "<Up>", "<Nop>")
keymap.set("i", "<Down>", "<Nop>")
keymap.set("i", "<Left>", "<Nop>")
keymap.set("i", "<Right>", "<Nop>")

-- Creates properly indented new lines between matching pairs
keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

-- [cmd] :restart
keymap.set('n', '<leader>re', ':restart<CR>', { noremap = true, silent = true })

-- [cmd] :Lazy
keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- yank/paste to clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true, desc = "Yank to system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard" })

-- insert -> normal
keymap.set({ "i", "v", "s" }, "<A-n>", "<Esc>", { noremap = true, silent = true })

-- save file
keymap.set({ "n", "v" }, "<A-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

-- Noice cmdline Enable/Disable keybinds
local noice_enabled = true

keymap.set("n", "<leader>:", function()
  if noice_enabled then
    vim.cmd("NoiceDisable")
    noice_enabled = false
  else
    vim.cmd("NoiceEnable")
    noice_enabled = true
  end
end, { desc = "Toggle Noice" })

-- noggle :noh
keymap.set("n", "<leader>n", function()
  vim.o.hlsearch = not vim.o.hlsearch
end, { desc = "Toggle search highlight" })

-- ctrl keybinds to alt keybinds
keymap.set('i', '<A-o>', '<C-o>', { noremap = true, silent = true })
keymap.set('n', '<A-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
