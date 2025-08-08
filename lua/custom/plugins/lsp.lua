return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'mason-org/mason.nvim', opts = {} },
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		"neovim/nvim-lspconfig",


		-- { 'j-hui/fidget.nvim',    opts = {} },

		'saghen/blink.cmp'
	},
	event = 'BufReadPre',
	config = function()
		require 'custom.configs.autofmt' ()

		require 'custom.configs.lsp'
	end
}
