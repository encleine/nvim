return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<tab>"] = { 'select_and_accept', 'fallback' },
			["<enter>"] = { 'select_and_accept', 'fallback' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<C-e>'] = { 'cancel', 'show', 'fallback' },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
		},

		signature = { enabled = true },

		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = { documentation = { auto_show = true } },

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },

			per_filetype = {
				sql = { 'snippets', 'dadbod', 'buffer' },
			},
			-- add vim-dadbod-completion to your completion providers
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		completion = {
			menu = {
				draw = {
					components = {
						-- customize the drawing of kind icons
						kind_icon = {
							text = function(ctx)
								-- default kind icon
								local icon = ctx.kind_icon
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
										{ kind = ctx.kind })
									if color_item and color_item.abbr ~= "" then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								-- default highlight group
								local highlight = "BlinkCmpKind" .. ctx.kind
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
										{ kind = ctx.kind })
									if color_item and color_item.abbr_hl_group then
										highlight = color_item.abbr_hl_group
									end
								end
								return highlight
							end,
						},
					},
				},
			},
		},
	},

	opts_extend = { "sources.default" }
}
