return {
  "EdenEast/nightfox.nvim",
  name = "nightfox",
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme carbonfox]]
  end
}

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
