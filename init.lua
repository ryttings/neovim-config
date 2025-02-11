vim.o.syntax = "on"
vim.o.number = true

--vim.cmd('cd $MYVIMRC/..')
-- vim.cmd('cd D:/UsefulThings')
vim.cmd('set expandtab')
vim.cmd('set tabstop=3')
vim.cmd('set softtabstop=3')
vim.cmd('set shiftwidth=3')
vim.cmd('let mapleader = ","')
vim.cmd('map <leader>h :noh<CR>')
vim.opt.shell = 'nu'
vim.opt.linebreak = true
vim.opt.shell = "fish"
vim.keymap.set('n', '<Up>', 'gk', { noremap = true })
vim.keymap.set('n', '<Left>', 'gh', { noremap = true})
vim.keymap.set('n', '<Down>', 'gj', { noremap = true})
vim.keymap.set('n', '<Right>', 'gl', { noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-s>', ':spl<CR>')
vim.keymap.set('n', '<C-s><C-v>', ':vsp<CR>')
vim.keymap.set('n', '<C-s><C-l>', ':vsp<CR>')
vim.keymap.set('n', '<C-s><C-h>', ':vsp<CR>')
vim.keymap.set('n', '<C-s><C-j>', ':spl<CR>')
vim.keymap.set('n', '<C-s><C-k>', ':spl<CR>')

vim.keymap.set('n', '<C-Right>', '<C-w><S-l>')
vim.keymap.set('n', '<C-Left>', '<C-w><S-h>')
vim.keymap.set('n', '<C-Up>', '<C-w><S-k>')
vim.keymap.set('n', '<C-Down>', '<C-w><S-j>')

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.keymap.set('c', 'wqa', 'wa<CR>:qa<CR>', { noremap = true })
vim.opt.termguicolors = false

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
vim.cmd("set clipboard+=unnamedplus")

vim.keymap.set('c', 'llm', function() vim.cmd('new') vim.cmd('terminal python3 /home/srytting/usefulthings/tools/llm.py') end)

require("lazy").setup("plugins")
