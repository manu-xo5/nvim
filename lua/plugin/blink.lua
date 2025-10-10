return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = { "folke/lazydev.nvim" },
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				auto_show = false,
			},
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 500,
			},
		},

		sources = {
			default = { "lsp", "path" },
		},

		fuzzy = { implementation = "lua" },

		signature = { enabled = true },
	},
}
