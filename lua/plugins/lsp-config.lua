return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = { "clangd", "pyright", "rust_analyzer", "cmake", "bashls", "jsonls", "lua_ls", "svls", "lemminx", "markdown_oxide" }
        }
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

            vim.lsp.config('pyright', {
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = "C:/Users/scotrytt/AppData/Local/Programs/Python/Python313/python.exe"
                    },
                },
            })

            vim.lsp.config('lua_ls', {capabilities = capabilities})
            vim.lsp.config('clangd', {
                capabilities = vim.tbl_deep_extend('force', capabilities, {
                    offsetEncoding = { "utf-16" }
                }),
                cmd = {
                    "clangd",
                    "--background-index"
                }
            })
            vim.lsp.config('rust_analyzer', {capabilities = capabilities})
            vim.lsp.config('cmake', {capabilities = capabilities})
            vim.lsp.config('asm_lsp', {capabilities = capabilities})
            vim.lsp.config('bashls', {capabilities = capabilities})
            vim.lsp.config('jsonls', {capabilities = capabilities})
            vim.lsp.config('svls', {capabilities = capabilities})
            vim.lsp.config('lemminx', {capabilities = capabilities})
            vim.lsp.config('markdown_oxide', {
                capabilities = vim.tbl_deep_extend('force', capabilities, {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                })
            })

            vim.keymap.set('n', '<leader>q', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>g', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<F12>', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<F1>', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>w', vim.lsp.buf.format)
            vim.keymap.set('n', ')', function() vim.diagnostic.jump({ count = 1 }) end)
            vim.keymap.set('n', '(', function() vim.diagnostic.jump({ count = -1 }) end)

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
