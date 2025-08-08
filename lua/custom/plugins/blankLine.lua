return {
	'lukas-reineke/indent-blankline.nvim',

	event = 'BufReadPre',
	config = function()
		require 'custom.configs.blankline'
	end
}
