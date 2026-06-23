local opt = vim.opt

-- tab indentation
opt.autoindent = true

-- number line
opt.number = true
opt.cursorline = true
opt.relativenumber = true
opt.scrolloff = 3

-- showing git changes column only at the changes otherwise turned off
opt.signcolumn = "auto"

-- performance
opt.updatetime = 50
opt.timeoutlen = 225
opt.synmaxcol = 200

-- better undo settings
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- mouse disabled
vim.opt.mouse = ""

-- hide mode from cmdline
vim.opt.showmode = false
