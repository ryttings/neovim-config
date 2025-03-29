return {
   {
      "williamboman/mason.nvim",
      lazy = false,
      config = function()
         require("mason").setup()
      end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "rust_analyzer", "cmake", "asm_lsp", "bashls", "jsonls", "lua_ls", "svls", "pyright" }
         })
      end
   },


   {
      "neovim/nvim-lspconfig",
      opts = {
         setup = {
            clangd = function(_, opts)
               opts.capabilities.offsetEncoding = { "utf-16" }
            end,
         },
      },
      lazy = false,
      config = function()
         local capabilities = vim.lsp.protocol.make_client_capabilities()
         local lspconfig = require("lspconfig")

         lspconfig.pyright.setup({ capabilities = capabilities, })
         lspconfig.lua_ls.setup({ capabilities = capabilities, })
         lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
               "clangd",
               "--offset-encoding=utf-16",
               "--background-index",
               "--query-driver=/usr/bin/g++-14",
               "-j=8"
            }
         })
         lspconfig.rust_analyzer.setup({ capabilities = capabilities, })
         lspconfig.cmake.setup({ capabilities = capabilities, })
         lspconfig.asm_lsp.setup({ capabilities = capabilities, })
         lspconfig.bashls.setup({ capabilities = capabilities, })
         lspconfig.jsonls.setup({ capabilities = capabilities, })
         lspconfig.svls.setup({ capabilities = capabilities, })

         vim.keymap.set('n', '<leader>q', vim.lsp.buf.hover, {})
         vim.keymap.set('n', '<leader>g', vim.lsp.buf.definition, {})
         vim.keymap.set('n', '<leader>gd', vim.lsp.buf.implementation, {})
         vim.keymap.set('n', '<leader>r', vim.lsp.buf.code_action, {})
         vim.keymap.set('n', '<F12>', vim.lsp.buf.references, {})
         vim.keymap.set('n', '<F1>', vim.lsp.buf.rename, {})
         vim.keymap.set('n', '<leader>w', vim.lsp.buf.format)
         vim.keymap.set('n', '<leader>d', vim.lsp.buf.document_symbol)
      end
   }
}
