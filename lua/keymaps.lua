-- ~/.config/nvim-new/lua/keymaps.lua
vim.keymap.set("n", "<leader>o", '<cmd>FzfLua files<CR>')
vim.keymap.set("n", "<leader>bf", '<cmd>FzfLua buffers<CR>')
vim.keymap.set("n", "<leader>tr", '<cmd>FzfLua treesitter<CR>')
vim.keymap.set("n", "<leader><Tab>", '<cmd>FzfLua tabs<CR>')
vim.keymap.set("n", "<leader>s", '<cmd>FzfLua global<CR>')
vim.keymap.set("n", "<leader>,", '<cmd>FzfLua combine pickers=oldfiles<CR>')
vim.keymap.set("n", "<leader>f", '<cmd>FzfLua live_grep<CR>')
vim.keymap.set("n", "<leader>gs", '<cmd>FzfLua git_status<CR>')
vim.keymap.set("n", "<leader>gd", '<cmd>FzfLua git_diff<CR>')
vim.keymap.set("n", "<leader>gb", '<cmd>FzfLua git_bcommits<CR>')

