local ns = vim.api.nvim_create_namespace("search_count")

local function set_counter_hl()
  vim.api.nvim_set_hl(0, "CounterStuff", {
    fg = "#000000",
    bg = "#f1fa8c",
  })
end

set_counter_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_counter_hl,
})

local function is_file_buffer()
  local buftype = vim.bo.buftype
  return buftype == ""
end

local function clear_search_count()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

local function update_search_count()
  clear_search_count()

  -- Only work in normal file buffers
  if not is_file_buffer() then
    return
  end

  if vim.v.hlsearch == 0 then
    return
  end

  local count = vim.fn.searchcount({
    recompute = 1,
    maxcount = 9999,
    timeout = 100,
  })

  if count.total == 0 then
    return
  end

  local cursor = vim.api.nvim_win_get_cursor(0)

  local match = vim.fn.searchpos(vim.fn.getreg("/"), "cnW")

  if cursor[1] ~= match[1] then
    return
  end

  vim.api.nvim_buf_set_extmark(0, ns, match[1] - 1, -1, {
    virt_text = {
      {
        string.format("[%d/%d]", count.current, count.total),
        "CounterStuff",
      },
    },
    virt_text_pos = "eol",
  })
end

vim.api.nvim_create_autocmd({
  "CursorMoved",
  "CmdlineLeave",
  "BufEnter",
}, {
    callback = function()
      if vim.fn.mode() ~= "c" then
        vim.schedule(update_search_count)
      end
    end,
  })

vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = clear_search_count,
})

vim.api.nvim_create_autocmd("SearchWrapped", {
  callback = update_search_count,
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "hlsearch",
  callback = function()
    if vim.v.option_new == "0" then
      clear_search_count()
    else
      vim.schedule(update_search_count)
    end
  end,
})
