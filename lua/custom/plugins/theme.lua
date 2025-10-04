return {
	{
		"encleine/monokai.nvim",
		priority = 1000,
		-- Configure your theme's setup function
		config = function()
			local palette = require("custom.setting.json").palette()
			if palette.theme ~= "monokai" then
				return false
			end

			require("monokai").setup({ palette = palette, italics = false })
			vim.cmd.colorscheme(palette.name)
		end,
	},
	{
		priority = 1000,
		"catppuccin/nvim",
		name = "catppuccin",
		-- Configure your theme's setup function
		config = function()
			local palette = require("custom.setting.json").palette()
			if palette.theme ~= "catppuccin" then
				return false
			end

			require("catppuccin").setup({ flavour = palette.name })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
