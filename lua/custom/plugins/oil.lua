return {
	"stevearc/oil.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"benomahony/oil-git.nvim",
	},

	lazy = false,
	config = function()
		require("custom.configs.oil")
	end,

	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
}
