return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"xzbdmw/colorful-menu.nvim",
	},

	version = "1.*",
	event = "BufReadPre",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<tab>"] = { "select_and_accept", "fallback" },
			["<enter>"] = { "select_and_accept", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },

			per_filetype = {
				sql = { "snippets", "dadbod", "lsp", "buffer" },
			},

			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = {
			enabled = false,
			window = {
				border = "rounded",
				winblend = 10,
			},
		},

		completion = {

			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winblend = 10,
				},
			},

			menu = {
				border = "rounded",
				winblend = 10,

				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
	},

	opts_extend = { "sources.default" },
}
