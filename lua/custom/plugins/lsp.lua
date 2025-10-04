return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",

		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		"saghen/blink.cmp",
		"mattn/vim-goaddtags",
	},
	event = "BufReadPre",
	config = function()
		require("custom.configs.lsp")
	end,
}
