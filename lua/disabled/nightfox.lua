-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd[[colorscheme catppuccin]]
--   end
-- }

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
--         {
--             transparent_background = false, -- set background to transparent
--             gamma = 1.00,             -- adjust the brightness of the theme
--             styles = {
--                 comments = { italic = true }, -- style for comments
--                 keywords = {},        -- style for keywords
--                 identifiers = {},     -- style for identifiers
--                 functions = {},       -- style for functions
--                 variables = {},       -- style for variables
--             },
--         }
--         -- custom options here
--     },
--     config = function()
--         vim.cmd [[colorscheme tokyodark]]
--     end,
-- }

-- return {
--     "bluz71/vim-moonfly-colors",
--     name = "moonfly",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd [[colorscheme moonfly]]
--     end
-- }
-- dragon, wave, lotus
-- return {
--     "rebelot/kanagawa.nvim",
--     opts = {


--         compile = false, -- enable compiling the colorscheme
--         undercurl = true, -- enable undercurls
--         commentStyle = { italic = true },
--         functionStyle = {},
--         keywordStyle = { italic = true },
--         statementStyle = { bold = true },
--         typeStyle = {},
--         transparent = false, -- do not set background color
--         dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--         terminalColors = true, -- define vim.g.terminal_color_{0,17}
--         colors = {         -- add/modify theme and palette colors
--             palette = {},
--             theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--         },
--         overrides = function(colors) -- add/modify highlights
--             return {}
--         end,
--         theme = "wave", -- Load "wave" theme
--         background = { -- map the value of 'background' option to a theme
--             dark = "wave", -- try "dragon" !
--             light = "lotus"
--         },
--     },
--     config = function()
--         vim.cmd [[colorscheme kanagawa-dragon]]
--     end
-- }
