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
