return {
	"folke/trouble.nvim",
	opts = {
		icons = {
			indent = {
				top         = "┃ ",
				middle      = "┣╸",
				last        = "┗╸",
				fold_open   = "🯀 ",
				fold_closed = "┇╸",
			}
		},
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>ql",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>qq",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>qc",
			"<cmd>Trouble lsp toggle focus win.position=bottom<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}
