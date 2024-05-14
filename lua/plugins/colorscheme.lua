-- return   {
--   "blazkowolf/gruber-darker.nvim",
--   opts = {
--     bold = false,
--     italic = {
--       strings = false,
--     },
--   },
-- }

-- return {
-- 	"NTBBloodbath/doom-one.nvim",
--   config = function ()
--     vim.g.doom_one_enable_treesitter = true
--     vim.cmd("colorscheme doom-one")
--   end
-- }

-- return {
-- 	"ramojus/mellifluous.nvim",
-- 	config = function()
-- 		require("mellifluous").setup({
-- 			dim_inactive = false,
-- 			color_set = "mountain",
-- 		})
-- 		vim.cmd("colorscheme mellifluous")
-- 	end,
-- }

-- return {
-- 	"briones-gabriel/darcula-solid.nvim",
-- 	dependencies = "rktjmp/lush.nvim",
-- 	config = function()
-- 		vim.cmd("colorscheme darcula-solid")
-- 	end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function ()
--     vim.cmd("colorscheme tokyonight-night")
--   end
-- }

return {
  "askfiy/visual_studio_code",
  priority = 100,
  config = function()
    require("visual_studio_code").setup({
      dim_inactive = false,
      transparent = true,
    })
    vim.cmd("colorscheme visual_studio_code")
  end,
}
