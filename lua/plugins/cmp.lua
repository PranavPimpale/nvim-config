local plugins = require('config.plugins')

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
          max_view_entries = 7,
        },

        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },

        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            max_height = 7,
            scrollbar = false,
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
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),

        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              luasnip = "[Snip]",
              nvim_lsp = "[LSP]",
              buffer = "[Buf]",
              path = "[Path]",
            })[entry.source.name]

            -- Remove the long detail text
            vim_item.abbr = vim_item.abbr
            return vim_item
          end,
        }
      })

      -- dimmed deprecated suggestions
      vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {
        fg = "#252525",
        strikethrough = false,
      })
    end,
  },
}
