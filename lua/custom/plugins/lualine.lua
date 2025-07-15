return {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	-- See `:help lualine.txt`


	opts = {

		sections = {
			lualine_b = { 'branch', 'location' },
			lualine_c = { 'selectioncount' },
			lualine_x = {
				{
					require("noice").api.statusline.mode.get,
					cond = require("noice").api.statusline.mode.has,
				},
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
				},
			},
			lualine_y = { '' },
			lualine_z = { '' },
		},

		extensions = {
			'oil',
			'fugitive',
			'mason',
			'lazy',
		}
	}
}
