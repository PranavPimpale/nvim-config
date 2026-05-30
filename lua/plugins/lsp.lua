-- lua/plugins/lsp.lua

return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      vim.lsp.enable("pyright")
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
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })

        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
          style = "minimal",
          border = "rounded",
          source = "if_many",
        },
      })
    end,
  },
}
