local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
   pattern = '*',
   callback = function()
      vim.highlight.on_yank({ timeout = 170 })
   end,
   group = highlight_group,
})

-- autocmd("FileType", {
--    callback = function()
--       vim.treesitter.start()
--    end
-- })

-- Replace these languages with the ones you work with
local ts_languages = { "lua", "python", "cpp", "c", "rust", "markdown", "template_language" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_languages,
  callback = function()
    -- Enable native Neovim treesitter highlighting
    vim.treesitter.start()

    -- Configure code folding
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldlevel = 99

    -- Enable treesitter-based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
