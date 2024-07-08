vim.o.syntax = "on"
vim.o.number = true

--vim.cmd('cd $MYVIMRC/..')
-- vim.cmd('cd D:/UsefulThings')
vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('let mapleader = ","')
vim.cmd('map <leader>h :noh<CR>')
<<<<<<< HEAD
-- vim.opt.shell = "PowerShell"
vim.opt.linebreak = true
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Left>', 'gh')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('n', '<Right>', 'gl')
=======
vim.opt.shell = 'pwsh.exe'
>>>>>>> origin/win

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
