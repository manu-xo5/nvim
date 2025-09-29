return {
	"stevearc/conform.nvim",
	config = function()
		local conf = require("conform")

		conf.setup({
			notify_on_error = false,
			format_on_save = false,
			formatters_by_ft = {
				lua = { "stylua" },
				["_"] = { "prettier", "prettierd" },
			},
		})

		vim.keymap.set("n", "<leader>lf", function()
			conf.format({ async = true, lsp_format = "fallback" })
		end)
	end,
}
