return {
	"mason-org/mason-lspconfig.nvim",
	event = "UIEnter",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"b0o/schemastore.nvim",
	},

	config = require("custom.configs.lsp"),
}
