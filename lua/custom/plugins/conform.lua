return {
	"stevearc/conform.nvim",

	event = "BufReadPre",
	config = require("custom.configs.conform"),
}
