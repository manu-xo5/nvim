return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"html",
					"css",
					"javascript",
					"tsx",
					"typescript",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },

				textobjects = {
					move = {
						enable = true,
						set_jumps = true,
						goto_next_end = {
							["]]"] = "@function.outer",
						},
						goto_previous_start = {
							["[["] = "@function.outer",
						},
					},
				},
			})
		end,
	},
}
