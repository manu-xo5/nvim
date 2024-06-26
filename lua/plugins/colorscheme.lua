-- return   {
--   "blazkowolf/gruber-darker.nvim",
--   opts = {
--     bold = false,
--     italic = {
--       strings = false,
--     },
--   },
--   config = function ()
--     vim.cmd("colorscheme gruber-darker")
--   end
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
      mode = "dark",
      dim_inactive = false,
      transparent = false,
      expand = {
        null_ls = true,
        nvim_cmp = true,
        lspconfig = true,
        telescope = true,
        bufferline = true,
        nvim_treesitter = true,
        vim_visual_multi = true,
      },
    })
    vim.cmd("colorscheme visual_studio_code")
  end,
}
