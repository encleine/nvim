return {
	"stevearc/oil.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = require("custom.configs.oil"),

	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
}
