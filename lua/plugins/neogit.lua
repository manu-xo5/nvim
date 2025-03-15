return {
	"NeogitOrg/neogit",
  cmd="Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua",              -- optional
		"echasnovski/mini.pick",         -- optional
	},
  keys = {
    { "<leader>G", ":Neogit kind=floating<CR>" }
  },
	config = true
}
