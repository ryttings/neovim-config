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
                ensure_installed = {
                    "clangd",
                    "rust_analyzer",
                    "cmake",
                    "bashls",
                    "jsonls",
                    "lua_ls",
                    "basedpyright",
                    "markdown_oxide",
                    "gopls"
                }
            })
        end
    },
}
