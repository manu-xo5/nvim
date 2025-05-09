return {
	'nvim-telescope/telescope.nvim',
	cmd = "Telescope",
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
		{ "<leader>fb", "<cmd>Telescope git_branches<CR>", desc = "Find keymaps" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "node%_modules/*", ".yarn/*", ".git/*", ".idea/*" },
		},
		pickers = {
			find_files = {
				hidden = true,
				previewer = false,
				-- layout_strategy = 'center',
				sorting_strategy = "ascending",
				theme = "dropdown",
			},
		},
	},
}

