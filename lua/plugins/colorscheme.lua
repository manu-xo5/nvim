local defaultConfig = function()
	vim.cmd("colorscheme mellifluous")
end

return {
	{
		"askfiy/visual_studio_code",
		priority = 100,
		opts = {
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
		},
		config = defaultConfig,
	},
	{
		"tjdevries/colorbuddy.nvim",
		lazy = false,
		priority = 1000,
		config = defaultConfig,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = defaultConfig,
	},
	{
		"ramojus/mellifluous.nvim",
		opts = {
			dim_inactive = false,
			color_set = "mountain",
		},
		config = defaultConfig,
	},
}
