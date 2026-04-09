return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme catppuccin]]
  end
}

-- return {
--   "EdenEast/nightfox.nvim",
--   name = "nightfox",
--   priority = 1000,
--   config = function()
--     vim.cmd[[colorscheme carbonfox]]
--   end
-- }

-- return {
--   "Mofiqul/vscode.nvim",
--   name = "vscode",
--   priority = 1000,
--   config = function()
--     vim.cmd[[colorscheme vscode]]
--   end
-- }

-- return {
--     "tiagovla/tokyodark.nvim",
--     opts = {
--         -- custom options here
--     },
--     config = function(_, opts)
--         require("tokyodark").setup(opts) -- calling setup is optional
--         vim.cmd [[colorscheme tokyodark]]
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     opts = {
--         -- custom options here
--     },
--     lazy = false,
--     priority = 1000,
--     config = function(_, opts)
--         vim.cmd [[colorscheme tokyonight-day]]
--     end,
-- }



-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--         vim.o.background = "light"
--         vim.cmd([[colorscheme gruvbox]])
--     end
--     ,
--     opts = ...
-- }
