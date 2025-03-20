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
		"nvim-lua/plenary.nvim",

		"nvimtools/none-ls.nvim",

		"pmizio/typescript-tools.nvim",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

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

				"rust_analyzer",
				"lua_ls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				["ts_ls"] = function()
					-- typescript-tools will call `require("lspconfig").ts_ls.setup({})`
					require("typescript-tools").setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
							on_attach(client, bufnr)
						end,
					})

					vim.keymap.set("n", "<leader>lR", vim.cmd.TSToolsRenameFile)
					vim.keymap.set("n", "<leader>ai", vim.cmd.TSToolsAddMissingImports)
					vim.keymap.set("n", "<leader>ru", vim.cmd.TSToolsRemoveUnusedImports)
					vim.keymap.set("n", "<leader>oi", vim.cmd.TSToolsOrganizeImports)
				end,

				-- ["rust_analyzer"] = function()
				-- 	require("lspconfig").rust_analyzer.setup({
				-- 		on_attach = on_attach,
				-- 		capabilities = capabilities,
				-- 		filetypes = { "rust" },
				-- 	})
				-- end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
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
