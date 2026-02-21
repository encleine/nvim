return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
	},

	config = require("custom.configs.lsp"),
}
