local M = {}

local win = nil
local buf = nil
local enabled = false

local function close_float()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
  win = nil
end

local function open_float()
  close_float()

  buf = vim.api.nvim_create_buf(false, true)

  local name = vim.fn.expand("%:t")
  if name == "" then
    name = "[No Name]"
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "󰈚 " .. name })

  local width = #("󰈚 " .. name)
  local col = vim.o.columns - width - 3

  win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    row = 0,
    col = col,
    width = width,
    height = 1,
    style = "minimal",
    border = "none",
    focusable = false,
    noautocmd = true,
    zindex = 200,
  })

  vim.wo[win].winblend = 0
end

local function update_float()
  if enabled then
    open_float()
  end
end

function M.toggle()
  enabled = not enabled

  if enabled then
    vim.o.laststatus = 0
    vim.o.cmdheight = 0
    open_float()
  else
    vim.o.laststatus = 3
    vim.o.cmdheight = 1
    close_float()
  end
end

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWritePost",
  "BufFilePost",
  "WinResized",
}, {
    callback = update_float,
  })

vim.api.nvim_create_user_command("ToggleStatusline", M.toggle, {})

-- status line toggle
vim.keymap.set("n", "<leader>0", "<cmd>ToggleStatusline<CR>", {
  desc = "Toggle Statusline",
})

return M
