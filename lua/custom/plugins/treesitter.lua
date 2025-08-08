return {
	-- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},

	event = 'BufReadPre',
	build = ':TSUpdate',
	config = function()
		require 'custom.configs.treesitter'
	end
}
