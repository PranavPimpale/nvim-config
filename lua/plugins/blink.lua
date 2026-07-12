local plugins = require("config.plugins")
local colors = require("config.colors")

return {
  {
    "saghen/blink.cmp",
    enabled = plugins.blink,
    event = "VeryLazy",
    version = "1.*",

    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },

    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },

      snippets = {
        preset = "luasnip",
      },

      signature = {
        enabled = true,
        trigger = {
          enabled = false,
        },
        window = {
          border = "rounded",
          show_documentation = false,
        },
      },

      cmdline = {
        enabled = true,
      },

      keymap = {
        preset = "none",

        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<M-l>"] = { "select_and_accept", "fallback" },
        ["<C-Space>"] = { "show" },

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        ["<C-n>"] = { "snippet_forward" },
        ["<C-v>"] = { "snippet_backward" },
        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      },

      completion = {
        trigger = {
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
        },

        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },

        menu = {
          border = "rounded",
          max_height = 10,
          min_width = 10,
          scrollbar = false,

          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },

            components = {
              label = {
                width = {
                  fill = true,
                  min = 15,
                  max = 35,
                },
              },

              source_name = {
                width = { max = 7 },

                text = function(ctx)
                  local labels = {
                    lsp = "[Lsp]",
                    snippets = "[Snip]",
                    buffer = "[Buf]",
                    path = "[Path]",
                  }

                  return labels[ctx.source_id]
                    or ("[" .. ctx.source_name .. "]")
                end,
              },
            },
          },
        },

        documentation = {
          auto_show = false,
          window = {
            border = "rounded",
          },
        },
      },

      sources = {
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
        },

        providers = {
          lsp = {
            score_offset = 100,

            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return not item.deprecated
              end, items)
            end,
          },

          snippets = {
            score_offset = 100,
          },

          path = {
            score_offset = -10,
          },

          buffer = {
            score_offset = -100,
          },
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",

        frecency = {
          enabled = false,
        },
      },
    },

    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("blink.cmp").setup(opts)

      local function set_match_hl()
        vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", {
          fg = colors.comment,
          bold = true,
        })

        vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
          bg = colors.bg,
        })

        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
          bg = nil,
          fg = colors.white,
        })

        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
          bg = colors.black,
        })
      end

      set_match_hl()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_match_hl,
      })
    end,
  },
}
