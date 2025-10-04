return {
	"stevearc/oil.nvim",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("custom.configs.oil")
	end,

	lazy = false,
	keys = {
		{
			"-",
			"<CMD>Oil<CR>",
			desc = "Open parent directory",
		},
	},
}
