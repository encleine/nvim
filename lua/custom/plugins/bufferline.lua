return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = require("custom.configs.bufferline"),
	event = "BufReadPre",
}
