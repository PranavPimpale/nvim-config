local opt = vim.o

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
local undodir = os.getenv("HOME") .. "/.vim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
opt.undodir = undodir
opt.undofile = true

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Mouse
opt.mouse = ""

-- CMD Mode Display
opt.showmode = false

-- line wrap
opt.wrap = true
opt.linebreak = true

-- netrw
vim.g.netrw_banner = 0         -- Hide banner
vim.g.netrw_liststyle = 3      -- Tree view
vim.g.netrw_browse_split = 0   -- Open in current window
vim.g.netrw_altv = 1           -- Vertical split to the right
vim.g.netrw_winsize = 25       -- Explorer width (%)
vim.g.netrw_keepdir = 0        -- Follow current directory

vim.cmd([[
  hi netrwDir guifg=#7aa2f7 gui=bold
  hi netrwClassify guifg=#565f89
  hi netrwExe guifg=#9ece6a
  hi netrwSymLink guifg=#7dcfff
]])
