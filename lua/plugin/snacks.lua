return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local snacks = require("snacks")

		snacks.setup({
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},

			input = {
				enabled = true,
				win = {
					title_pos = "left",
					relative = "cursor",
					row = -3,
					col = -3,
				},
			},

			picker = { enabled = true },
		})

		vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Find Files (Snacks Picker)" })
		vim.keymap.set("n", "<leader>ft", snacks.picker.grep, { desc = "Grep word" })
		vim.keymap.set("n", "<leader>fb", snacks.picker.git_branches, { desc = "Pick and Switch Git Branches" })
		vim.keymap.set("n", "<leader>fc", snacks.picker.colorschemes, { desc = "Pick Color Schemes" })
	end,
	opts = {},
}
