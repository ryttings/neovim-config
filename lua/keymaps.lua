--- fzf ---
vim.keymap.set("n", "<leader>o", '<cmd>FzfLua files<CR>')
vim.keymap.set("n", "<leader>bf", '<cmd>FzfLua buffers<CR>')
vim.keymap.set("n", "<leader><Tab>", '<cmd>FzfLua tabs<CR>')
vim.keymap.set("n", "<leader>s", '<cmd>FzfLua global<CR>')
vim.keymap.set("n", "<leader>,", '<cmd>FzfLua combine pickers=oldfiles<CR>')
vim.keymap.set("n", "<leader>f", '<cmd>FzfLua live_grep<CR>')
vim.keymap.set("n", "<leader>gs", '<cmd>FzfLua git_status<CR>')
vim.keymap.set("n", "<leader>gd", '<cmd>FzfLua git_diff<CR>')
vim.keymap.set("n", "<leader>gb", '<cmd>FzfLua git_bcommits<CR>')
vim.keymap.set("n", "<leader>.", '<cmd>FzfLua resume<CR>')
vim.keymap.set("n", "<leader>*", '<cmd>FzfLua grep_cword<CR>')
vim.keymap.set("n", "<leader>*", '<cmd>FzfLua grep_visual<CR>')
vim.keymap.set("n", "<leader>y", '<cmd>FzfLua lsp_document_symbols<CR>')
vim.keymap.set("n", "<leader>D", '<cmd>FzfLua diagnostics_workspace<CR>')
vim.keymap.set('n', '<F12>', "<cmd>FzfLua lsp_references<CR>")

--- LSP ---
vim.keymap.set('n', '<leader>q', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>g', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<F1>', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>w', function()
   -- conform runs the configured CLI formatters (markdown -> mdformat + cbfmt)
   -- and falls back to LSP formatting for every other filetype
   require('conform').format({ lsp_format = 'fallback' })
end)
vim.keymap.set('n', '<leader>x', vim.lsp.buf.code_action, {})
vim.keymap.set('n', ')', function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set('n', '(', function() vim.diagnostic.jump({ count = -1 }) end)

vim.keymap.set('n', '<leader>d', function()
   vim.diagnostic.open_float({ scope = "cursor" })
end)

vim.keymap.set('n', '<leader>r', function()
   local picked = false
   local lnum = vim.api.nvim_win_get_cursor(0)[1]
   local line = vim.api.nvim_get_current_line()
   vim.lsp.buf.code_action({
      apply = true,
      range = {
         start = { lnum, 0 },
         ["end"] = { lnum, math.max(#line - 1, 0) },
      },
      -- Auto-apply the first quickfix/preferred action, skipping refactor-style ones
      filter = function(action)
         if picked then
            return false
         end
         if action.isPreferred or (action.kind and vim.startswith(action.kind, "quickfix")) then
            picked = true
            return true
         end
         return false
      end,
   })
end)
