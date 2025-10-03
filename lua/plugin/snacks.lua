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
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
						},
					},
				},
			},

			picker = {
				enabled = true,

				sources = {
					files = {
						layout = {
							preset = "select",
							preview = nil,
						},
					},
					grep = {
						matcher = {
							file_pos = false,
						},
						layout = {
							preset = "default",
						},
					},
				},
				formatters = {
					file = {
						truncate = 10000,
					},
				},
			},

			rename = { enabled = true },

			scratch = { enabled = true },
		})

		vim.keymap.set("n", "<leader>ff", snacks.picker.files)
		vim.keymap.set("n", "<leader>fn", function()
			snacks.picker.files({
				cwd = vim.fn.stdpath("config") .. "/lua",
			})
		end)
		vim.keymap.set("n", "<leader>ft", snacks.picker.grep)
		vim.keymap.set("n", "<leader>fb", snacks.picker.git_branches)
		vim.keymap.set("n", "<leader>fc", snacks.picker.colorschemes)

		vim.keymap.set("n", "grN", snacks.rename.rename_file)

		vim.keymap.set("n", "<leader>to", function()
			snacks.scratch.open({
				file = vim.fn.stdpath("data") .. "/scratch/scratch.lua",
			})
		end)
	end,
	opts = {},
}
