vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.formatoptions:remove({ "o" })

vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')
vim.opt.linebreak = true

vim.cmd('let mapleader = ","')
vim.cmd('map <leader>h :noh<CR>')
vim.keymap.set('n', '<Up>', 'gk', { noremap = true })
vim.keymap.set('n', '<Left>', 'gh', { noremap = true })
vim.keymap.set('n', '<Down>', 'gj', { noremap = true })
vim.keymap.set('n', '<Right>', 'gl', { noremap = true })
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
vim.keymap.set('c', 'wqa', 'wa<CR>:qa<CR>', { noremap = true })
vim.keymap.set('n', '<C-a>', 'gg0vG$')

vim.keymap.set('n', '<C-Right>', '<C-w><S-l>')
vim.keymap.set('n', '<C-Left>', '<C-w><S-h>')
vim.keymap.set('n', '<C-Up>', '<C-w><S-k>')
vim.keymap.set('n', '<C-Down>', '<C-w><S-j>')
vim.keymap.set('n', '<C-=>', '<C-w>=', { noremap = true })
vim.keymap.set('v', '<C-S-c>', '"+y')

vim.keymap.set('v', '<leader>cl', ':s/\\U/\\l&/g', { noremap = true }, { desc = 'Convert to lowercase' })
vim.keymap.set('v', '<leader>cu', ':s/\\l/\\U&/g', { noremap = true }, { desc = 'Convert to uppercase' })

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.opt.termguicolors = false
vim.opt.shell = os.getenv("SHELL")

local python_cmd = os.getenv("PYTHON") or "python3"
local cmd_shell = os.getenv("CMD_SHELL") or vim.opt.shell

local home = os.getenv("HOME")

-- local llm_script = string.format("%s/dotfiles/scripts/%s", home, "gemini.py")
local llm_script = string.format("%s/dotfiles/scripts/%s", home, "llm.py")
print(llm_script)

vim.keymap.set('c', 'llm',
    function()
        vim.cmd('new')
        local term_shell = vim.opt.shell
        vim.opt.shell = cmd_shell
        vim.cmd(string.format('terminal %s %s', python_cmd, llm_script))
        vim.cmd("set filetype=markdown")
        vim.opt.shell = term_shell
    end)

-- Copy full path to clipboard
vim.keymap.set('n', '<leader>p', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)

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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.template_language = {
    install_info = {
        url = "~/repos/template/treesitter-parser",
        files = { "src/parser.c" },
        generate_requires_npm = true,
        requires_generate_from_grammar = false,
    },
    filetype = "template_language",
}

-- Register the filetype
vim.filetype.add({
    extension = {
        tp = "template_language",
    },
})

vim.opt.conceallevel = 2
vim.opt.signcolumn = "yes:1"

-- Backup files
-- Double slash to build file name from the complete path to the file with all path separators changed to percent '%' signs
vim.opt.backupdir = string.format("%s/.nvim-backup/", home)
vim.opt.backup = true
vim.opt.undofile = true

-- Add timestamp as extension for backup files
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('timestamp_backupext', { clear = true }),
  desc = 'Add timestamp to backup extension',
  pattern = '*',
  callback = function()
    vim.opt.backupext = '-' .. vim.fn.strftime('%Y%m%d%H%M')
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "o" }
  end,
})

require("lsp")
