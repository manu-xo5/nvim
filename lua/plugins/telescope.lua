return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
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
				-- layout_config = {
				-- 	anchor = "N",
				-- 	prompt_position = "top",
				-- },
			},
		},
	},
}
