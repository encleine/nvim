return {
	"lukas-reineke/indent-blankline.nvim",

	event = "BufReadPre",
	config = require("custom.configs.blankline"),
}
