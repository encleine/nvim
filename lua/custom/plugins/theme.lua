return {
	{
		"encleine/monokai.nvim",
		priority = 2000,
		-- Configure your theme's setup function
		config = function()
			local palette = require("custom.setting.json").palette()
			if palette.theme ~= "monokai" then
				return
			end

			require("monokai").setup({ palette = palette, italics = false })
			vim.cmd.colorscheme(palette.name)
			vim.api.nvim_set_hl(0, "LspCodeLens", { fg = palette.green, italic = true })
		end,
	},
	{
		priority = 2000,
		"catppuccin/nvim",
		name = "catppuccin",
		-- Configure your theme's setup function
		config = function()
			local palette = require("custom.setting.json").palette()
			if palette.theme ~= "catppuccin" then
				return
			end

			require("catppuccin").setup({ flavour = palette.name })
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "LspCodeLens", { fg = palette.teal, italic = true })
		end,
	},
}
