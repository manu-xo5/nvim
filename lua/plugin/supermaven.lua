return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-l>",
			},
			ignore_filetypes = {},
			log_level = "info",
		})

		local api = require("supermaven-nvim.api")

		vim.keymap.set("n", "<leader><s-s>", api.toggle)
	end,
}
