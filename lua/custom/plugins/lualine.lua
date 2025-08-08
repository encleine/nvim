return {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',

	-- event = 'VeryLazy',
	config = function() require 'custom.configs.lualine' end
}
