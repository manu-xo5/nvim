local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set
	keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "gl", vim.diagnostic.open_float, opts)
	keymap("n", "]d", vim.diagnostic.goto_next, opts)
	keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
	keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
	keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
	keymap("n", "<leader>lf", vim.lsp.buf.format, opts)
end

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"nvimtools/none-ls.nvim",
		"nvim-lua/plenary.nvim",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		-- setup lsp servers
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"cssls",
				"bashls",
				"tailwindcss",
				"ts_ls",
				"jsonls",
				"prismals",

				"lua_ls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		-- setup linters
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			automatic_setup = true,
			automatic_installation = true,
			ensure_installed = {
				"prettier",
				"stylua",
			},

			debug = false,
			sources = {
				formatting.prettierd,
				formatting.stylua,
			},
		})

		-- setup completion menu
		local cmp = require("cmp")
		cmp.setup({
			-- snippet = {
			-- 	expand = function(args)
			-- 		require("luasnip").lsp_expand(args.body)
			-- 	end,
			-- },
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true, behaviour = cmp.ConfirmBehavior.Replace }),
				["<C-Space>"] = cmp.mapping.complete(), -- Ensure it's set up correctly
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})
	end,
}
