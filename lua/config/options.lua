local opt = vim.opt

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.autoindent = true

-- Line Display
opt.number = true
opt.cursorline = true
opt.relativenumber = true
opt.scrolloff = 3

-- Git Sign Column
opt.signcolumn = "yes"

-- Performance
opt.updatetime = 50
opt.timeoutlen = 225
opt.synmaxcol = 200

-- Persistent Undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse
vim.opt.mouse = ""

-- CMD Mode Display
vim.opt.showmode = false
