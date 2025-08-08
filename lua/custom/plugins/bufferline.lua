return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function() require 'custom.configs.bufferline' end,
	event = 'BufReadPre',
}
