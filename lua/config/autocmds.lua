local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "python",
    "html",
    "javascript",
    "css"
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

--[[ format after save
api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("silent! normal! gg=G")
    vim.fn.winrestview(view)
  end,
})]]--

-- 3 sec only for saved message in cmdline
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("echo ''")
    end, 500)
  end,
})
