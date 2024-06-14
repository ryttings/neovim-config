vim.o.syntax = "on"
vim.o.number = true

vim.cmd('cd $MYVIMRC/..')
vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- nvim-tree config below
-- local function my_on_attach(bufnr)
  -- local api = require "nvim-tree.api"

  -- local function opts(desc)
    -- return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.toggle)
  -- vim.keymap.set('n', '<CR>', api.node.open.edit)
  -- vim.keymap.set('n', 'C-+', api.tree.change_root_to_node)
  -- vim.keymap.set('n', 'C-_', api.tree.change_root_to_parent)
-- end

-- pass to setup along with your other options
-- require("nvim-tree").setup {
  ---
  -- on_attach = my_on_attach,
  ---
-- }

-- vim.keymap.set('n', '<C-t>', ":NvimTreeToggle<CR>")
