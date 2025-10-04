return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "┇" },
			topdelete = { text = "┇" },
			changedelete = { text = "┇" },
		},
		current_line_blame = true,
		current_line_blame_formatter = "<author_time:%Y-%m-%d> <author> - <summary>",
	},
}
