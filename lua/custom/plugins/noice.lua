return {
	"folke/noice.nvim",

	event = "VeryLazy",
	lazy = true,
	opts = {
		notify = { enabled = false },
		messages = { view = "mini", view_warn = "mini" },
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
			},

			hover = {
				enabled = true,
				opts = {
					border = "rounded",
					winblend = 10,
				},
			},

			signature = { enabled = false },
		},

		presets = {
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true,
		},

		cmdline = {
			format = {
				cmdline = { pattern = "^:", icon = "🮲🮳", lang = "vim" },
			},
		},

		views = {

			cmdline_popup = {

				position = {
					row = 5,
					col = "50%",
				},

				size = {
					width = 60,
					height = "auto",
				},
			},

			popupmenu = {

				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},

				size = {
					width = 60,
					height = 10,
				},

				border = {
					style = "rounded",
					padding = { 0, 1 },
				},

				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	},

	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
