return {
    "https://github.com/pechorin/any-jump.vim",

    config = function()
        vim.keymap.set("n", "<leader>g", ":AnyJump<CR>")
        -- vim.keymap.set("n", "<leader>g", ":AnyJumpVisual<CR>")
        vim.keymap.set("n", "<leader>e", ":AnyJumpBack<CR>")
        vim.keymap.set("n", "<leader>j", ":AnyJumpBack<CR>")
        vim.cmd("let g:any_jump_disable_default_keybindings = 1")
        -- vim.cmd('let s:rg_base_cmd = "rg -n --pcre2 --engine auto --json --unicode"')

    end
}
