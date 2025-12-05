return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",

		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		"saghen/blink.cmp",
		{
			"mattn/vim-goaddtags",
			ft = "go",
		},
	},

	config = require("custom.configs.lsp"),
}
