local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "python", "html", "javascript", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- 3 sec only for saved message in cmdline
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("echo ''")
    end, 500)
  end,
})

-- restore cursor to file position in previous editing session
api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      -- defer centering slightly so it's applied after render
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end
  end,
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})

-- transparent background, no matter what theme
local transparent_groups = {
  "Normal",
  "NormalFloat",
  "FloatBorder",

  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "TelescopePromptTitle",
  "TelescopeResultsNormal",
  "TelescopeResultsBorder",
  "TelescopeResultsTitle",
  "TelescopePreviewNormal",
  "TelescopePreviewBorder",
  "TelescopePreviewTitle",
}

local function transparent_bg()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

transparent_bg()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = transparent_bg,
})

-- remove trailing spaces after saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])

    vim.fn.winrestview(view)
  end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})
