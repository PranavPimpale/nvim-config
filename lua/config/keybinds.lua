local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- switching between nvim-tree and buffer
keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- switching between buffer tabs 
keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- Insert mode cursor movement with Ctrl + h/j/k/l
keymap.set('i', '<C-h>', '<Left>',  { noremap = true, silent = true })
keymap.set('i', '<C-j>', '<Down>',  { noremap = true, silent = true })
keymap.set('i', '<C-k>', '<Up>',    { noremap = true, silent = true })
keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })

-- Creates properly indented new lines between matching pairs
keymap.set("i", "<CR>", function()
  return require("nvim-autopairs").autopairs_cr()
end, { expr = true })

-- [cmd] :restart
keymap.set('n', '<leader>re', ':restart<CR>', { noremap = true, silent = true })

-- [cmd] :Lazy
keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- [cmd] :q!
keymap.set('n', '<C-q>', ':q!<CR>', { noremap = true, silent = true })

-- file saving with ctrl+s
keymap.set({ "n", "v" }, "<C-s>", "<cmd>w<CR>", {
  desc = "Save file",
})

-- yank/paste to clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true, desc = "Yank to system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { silent = true, desc = "Paste from system clipboard" })

-- replacing <Esc> with Ctrl+s
keymap.set({ "i", "v", "s" }, "<C-s>", "<Esc>", { noremap = true, silent = true })

-- Noice Enable/Disable keybinds
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
