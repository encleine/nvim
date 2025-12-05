return {
	"MeanderingProgrammer/treesitter-modules.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	---@module 'treesitter-modules'
	---@type ts.mod.UserConfig
	opts = {

		highlight = {
			enable = true,
			disable = false,
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader><CR>",
				node_incremental = "<CR>",
				node_decremental = "<leader><CR>",
			},
		},
	},
}
