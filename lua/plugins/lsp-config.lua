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
                    "bashls",
                    "svls",
                    "jsonls",
                    "lua_ls",
                    "basedpyright",
                    "ruff",
                    "markdown_oxide",
                    -- "beautysh"
                }
            })
        end
    },
}
