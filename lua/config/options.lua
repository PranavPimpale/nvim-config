local opt = vim.opt

-- tab indentation
opt.autoindent = true

-- number line
opt.number = true
opt.cursorline = true
opt.relativenumber = true

-- showing git changes column only at the changes otherwise turned off
opt.signcolumn = "auto"

-- performance
opt.updatetime = 100
opt.timeoutlen = 300
opt.synmaxcol = 200
