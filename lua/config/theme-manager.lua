local M = {}

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

local themes = {
  "vague",
  "kanagawa-dragon",
  "kanagawa-wave",
  "everforest",
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
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local themes_ui = require("telescope.themes")

  pickers.new(themes_ui.get_dropdown({
    previewer = false,
    layout_config = {
      width = 0.25,
      height = 0.9,
      anchor = "E",
    },
    selection_caret = "➜ ",
  }), {
      prompt_title = "Colorschemes",

      finder = finders.new_table({
        results = themes,
      }),

      sorter = conf.generic_sorter({}),

      attach_mappings = function(prompt_bufnr)
        local function preview_theme()
          local entry = action_state.get_selected_entry()
          if entry then
            pcall(vim.cmd.colorscheme, entry[1])
          end
        end

        actions.move_selection_next:enhance({
          post = function()
            vim.schedule(preview_theme)
          end,
        })

        actions.move_selection_previous:enhance({
          post = function()
            vim.schedule(preview_theme)
          end,
        })

        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          if entry then
            M.save(entry[1])
          end
        end)

        return true
      end,
    }):find()
end

vim.keymap.set("n", "<leader>ut", function()
  require("config.theme-manager").pick()
end, { desc = "Theme Picker" })

M.load()
return M
