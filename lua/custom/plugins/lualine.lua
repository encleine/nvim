return {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',

	-- event = "lazy",
	config = function()
		require 'custom.configs.lualine'.setup()
	end
}
