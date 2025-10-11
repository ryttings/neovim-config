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
         vim.lsp.config("*", {})
         vim.lsp.config("clangd",
            {
               cmd = {
                  "clangd",
                  "--offset-encoding=utf-16",
                  "--background-index",
                  "--query-driver=/usr/bin/g++-15",
                  "-j=8"
               }
            })

         vim.lsp.enable({
            "clangd",
            "pyright",
            "svls",
            "cmake",
            "bashls",
            "jsonls",
            "lua_ls",
            "svls",
            "rust_analyzer",
            "asm_lsp",
         })

         vim.keymap.set('n', '<leader>q', vim.lsp.buf.hover, {})
         vim.keymap.set('n', '<leader>g', vim.lsp.buf.definition, {})
         vim.keymap.set('n', '<leader>gd', vim.lsp.buf.implementation, {})
         vim.keymap.set('n', '<leader>r', vim.lsp.buf.code_action, {})
         vim.keymap.set('n', '<F12>', vim.lsp.buf.references, {})
         vim.keymap.set('n', '<F1>', vim.lsp.buf.rename, {})
         vim.keymap.set('n', '<leader>w', vim.lsp.buf.format)

         vim.keymap.set('n', ')', function()
            vim.diagnostic.jump({ count = 1 })
         end)
         vim.keymap.set('n', '(', function()
            vim.diagnostic.jump({ count = -1 })
         end)

         vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
            float = {
               source = "always",
               border = "rounded",
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
         })

         vim.keymap.set('n', '<leader>d', function()
            vim.diagnostic.open_float({ scope = "cursor" })
         end)
      end
   }
}
