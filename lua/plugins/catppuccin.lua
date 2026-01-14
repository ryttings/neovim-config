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
