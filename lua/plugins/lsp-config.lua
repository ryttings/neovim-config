return{
  {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup()
  end
  },
  {"williamboman/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "pyright", "rust_analyzer", "cmake", "asm_lsp", "bashls", "jsonls", "lua_ls", "svls"}
    })
  end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.cmake.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.bashls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.svls.setup({})

      vim.keymap.set('n', '<C-i>', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<M-g>', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<M-r>', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<F12>', vim.lsp.buf.references, {})
    end
  }
}
