return {
	{
		'encleine/monokai.nvim',
		priority = 1000,
		-- Configure your theme's setup function
		config = function()
			local settings = require('custom.setting.json').settings
			if settings.palette.theme ~= "monokai" then return false end

			require('monokai').setup { palette = settings.palette.palette, italics = false }
			vim.cmd.colorscheme(settings.palette.name)
		end,
	},
	{
		priority = 1000,
		'catppuccin/nvim',
		name = "catppuccin",
		-- Configure your theme's setup function
		config = function()
			local settings = require('custom.setting.json').settings
			if settings.palette.theme ~= "catppuccin" then return false end

			require('catppuccin').setup { flavour = settings.palette.name }
			vim.cmd.colorscheme('catppuccin')
		end,
	},
}
