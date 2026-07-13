local plugins = require('config.plugins')
local colors = require('config.colors')

return {
  {
    "hrsh7th/nvim-cmp",
    enabled = plugins.cmp,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local function no_deprecated(entry)
        return not entry:get_completion_item().deprecated
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        performance = {
          debounce = 20,
          throttle = 10,
          fetching_timeout = 100,
          max_view_entries = 10,
        },

        completion = {
          completeopt = "menu,menuone,noinsert",
          autocomplete = { cmp.TriggerEvent.TextChanged },
        },

        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            max_height = 8,
            scrollbar = false,
            side_padding = 1,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CmpSel,Search:None",
          }),
        },

        view = {
          docs = {
            auto_open = false,
          },
        },

        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),

          ["<M-l>"] = cmp.mapping.confirm({
            select = true,
          }),

          ["<C-Space>"] = cmp.mapping.complete(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-n>"] = cmp.mapping(function()
            local luasnip = require("luasnip")
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),

          ["<C-v>"] = cmp.mapping(function()
            local luasnip = require("luasnip")
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")

            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "luasnip", entry_filter = no_deprecated },
          { name = "nvim_lsp", entry_filter = no_deprecated },
          { name = "buffer", entry_filter = no_deprecated },
          { name = "path", entry_filter = no_deprecated },
        }),

        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = ""
            vim_item.menu = ({
              luasnip = "[Snip] ",
              nvim_lsp = "[Lsp]  ",
              buffer = "[Buf]  ",
              path = "[Path] ",
            })[entry.source.name]

            -- Remove the long detail text
            vim_item.abbr = vim_item.abbr
            return vim_item
          end,
        }
      })

      -- clears the buffer for suggesting window if nothing is written
      vim.api.nvim_create_autocmd("TextChangedI", {
        callback = function()
          local col = vim.fn.col(".") - 1
          local line = vim.fn.getline(".")
          local prefix = line:sub(1, col):match("%S+$")

          if not prefix and cmp.visible() then
            cmp.close()
          end
        end,
      })

      -- coloring stuffs
      vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = colors.white,
        bg = nil,
      })

      vim.api.nvim_set_hl(0, "CmpSel", {
        fg = nil,
        bg = colors.select,
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {
        fg = colors.comment,
        bold = true,
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {
        fg = colors.comment,
        bold = true,
      })

      vim.api.nvim_set_hl(0, "CmpItemAbbr", {
        fg = colors.itemAbbr,
      })

      vim.api.nvim_set_hl(0, "CmpItemMenu", {
        fg = colors.white,
      })

      vim.api.nvim_set_hl(0, "CmpItemKind", {
        fg = colors.dark,
      })
    end,
  },
}

