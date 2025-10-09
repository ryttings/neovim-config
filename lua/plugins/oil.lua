return
{
    'stevearc/oil.nvim',
    opts = {
        -- For float window
        float = {
            padding = 2,
            max_width = 200,
            max_height = 40,
            border = "rounded",
            win_options = {
                winblend = 10,
            },
        },
        -- Or for side window
        -- view_options = {
        --     show_hidden = true,
        --     is_hidden_file = function(name, bufnr)
        --         return vim.startswith(name, ".")
        --     end,
        --     is_always_hidden = function(name, bufnr)
        --         return false
        --     end,
        -- },
    },
    keys = {
        -- Float window
        { "<leader>l", "<CMD>Oil --float<CR>", desc = "Open Oil file explorer" },
        -- Or side window
        -- { "<leader>t", "<CMD>Oil<CR>", desc = "Open Oil file explorer" },
        -- { "<backspace>", "<CMD>Oil ..<CR>", desc = "Open Oil file explorer" },
    },
}
