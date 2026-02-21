return {
	"christoomey/vim-tmux-navigator",

	-- Detect tabstop and shiftwidth automatically

	"folke/which-key.nvim",

	{ "vimpostor/vim-tpipeline", event = "VeryLazy" },

	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{ "NMAC427/guess-indent.nvim", opts = {} },
	"tpope/vim-fugitive",
}
