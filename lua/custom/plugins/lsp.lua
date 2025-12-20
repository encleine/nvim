return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		"saghen/blink.cmp",
		"mattn/vim-goaddtags",
	},

	-- event = "BufReadPre",
	config = require("custom.configs.lsp"),
}
