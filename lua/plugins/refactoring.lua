return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({
			prompt_func_return_type = {
        ts = false,
			},
			prompt_func_param_type = {
        ts = true,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = true,
		})
	end,
}
