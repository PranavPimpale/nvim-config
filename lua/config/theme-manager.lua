local M = {}

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

local themes = {
  "vague",
  "kanagawa",
}

local function read_saved_theme()
  local f = io.open(theme_file, "r")
  if not f then return nil end

  local theme = f:read("*l")
  f:close()

  if theme then
    theme = theme:match("^%s*(.-)%s*$")
  end

  return (theme and theme ~= "") and theme or nil
end

local function write_saved_theme(theme)
  local f = io.open(theme_file, "w")
  if not f then return false end
  f:write(theme)
  f:close()
  return true
end

local function apply_theme(theme)
  local ok, err = pcall(vim.cmd.colorscheme, theme)
  if not ok then
    vim.notify(("theme-manager: failed to load colorscheme '%s'\n%s"):format(theme, err),
      vim.log.levels.ERROR)
  end
  return ok
end

function M.load()
  local theme = read_saved_theme()
  if theme then
    apply_theme(theme)
  end
end

function M.save(theme)
  if not apply_theme(theme) then return end
  if not write_saved_theme(theme) then
    vim.notify("theme-manager: could not save theme to " .. theme_file, vim.log.levels.WARN)
  end
end

function M.pick()
  vim.ui.select(themes, { prompt = "Choose Colorscheme" }, function(choice)
    if choice then
      M.save(choice)
    end
  end)
end

vim.keymap.set("n", "<leader>ut", function()
  require("config.theme-manager").pick()
end, { desc = "Theme Picker" })

M.load()
return M
