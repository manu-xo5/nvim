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

			explorer = {
				enabled = true,
			},

			indent = {
				enabled = true,
				animate = { enabled = false },
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

			picker = {
				enabled = true,
				formatters = {
					file = {
						truncate = 10000,
					},
				},

				sources = {
					explorer = {
            layout = {
              layout = {
                width = 0.25,
              }
            },
						win = {
							list = {
								keys = {
									["."] = "",
									["-"] = "explorer_close",
									["<tab>"] = "",
									["<s-tab>"] = "",
								},
							},
						},
					},
				},
			},

			rename = { enabled = true },

			scratch = { enabled = true },
		})

		vim.keymap.set("n", "<leader>ff", function()
			snacks.picker.files({ layout = "select" })
		end)

		vim.keymap.set("n", "<leader>fc", function()
			snacks.picker.files({
				cwd = vim.fn.stdpath("config") .. "/lua",
			})
		end)

		vim.keymap.set("n", "<leader>fw", function()
			snacks.picker.grep({
				layout = "default",
			})
		end)

		vim.keymap.set("n", "<leader>fb", function()
			snacks.picker.git_branches()
		end)

		vim.keymap.set("n", "<leader>ft", function()
			snacks.picker.colorschemes()
		end)

		vim.keymap.set("n", "grN", function()
			snacks.rename.rename_file()
		end)

		vim.keymap.set("n", "<leader>to", function()
			snacks.scratch.open({
				file = vim.fn.stdpath("data") .. "/scratch/scratch.lua",
			})
		end)

		vim.keymap.set("n", "<leader>e", function()
			local explorerWin = Snacks.picker.get({ source = "explorer" })[1]
			if explorerWin == nil then
				Snacks.picker.explorer()
			elseif explorerWin:is_focused() then
				Snacks.picker.explorer()
			else
				Snacks.picker.explorer()
				Snacks.picker.explorer()
			end
		end)
	end,
	opts = {},
}
