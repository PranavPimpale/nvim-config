local plugins = require('config.plugins')

return {
  {
    "neovim/nvim-lspconfig",
    enabled = plugins.lsp,

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      local servers = {
        "clangd",
        "pyright",
        "lua_ls",
        -- "rust_analyzer",
        -- "ts_ls",
        -- "html",
        -- "cssls",
        -- "jsonls",
      }

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }

        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          }
        end

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end

      -- Lsp diagnostic configuration
      vim.diagnostic.config({
        virtual_text = false,-- { prefix = "<" },
        severity_sort = true,
        update_in_insert = false, -- live error checking in insert mode
        signs = false,
        underline = false,
        float = {
          style = "minimal",
          border = "rounded",
          source = "if_many",
        },
      })
    end,
  },
}
