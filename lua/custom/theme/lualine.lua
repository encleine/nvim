local palette = require('custom.theme.base')

local theme = {

	theme = {
		inactive = {
			a = { fg = palette.base2, bg = palette.pink, gui = "bold" },
			b = { fg = palette.pink, bg = palette.base0 },
			c = { fg = palette.pink, bg = palette.base2 },
		},
		visual = {
			a = { fg = palette.base2, bg = palette.purple, gui = "bold" },
			b = { fg = palette.purple, bg = palette.base0 },
			c = { fg = palette.purple, bg = palette.base2 },
		},
		replace = {
			a = { fg = palette.base2, bg = palette.purple, gui = "bold" },
			b = { fg = palette.purple, bg = palette.base0 },
			c = { fg = palette.purple, bg = palette.base2 },
		},
		normal = {
			a = { fg = palette.base2, bg = palette.pink, gui = "bold" },
			b = { fg = palette.pink, bg = palette.base0 },
			c = { fg = palette.pink, bg = palette.base2 },
		},
		insert = {
			a = { fg = palette.base2, bg = palette.green, gui = "bold" },
			b = { fg = palette.green, bg = palette.base0 },
			c = { fg = palette.green, bg = palette.base2 },
		},
		command = {
			a = { fg = palette.base2, bg = palette.red, gui = "bold" },
			b = { fg = palette.red, bg = palette.base0 },
			c = { fg = palette.red, bg = palette.base2 },
		},
	},

	always_divide_middle = true,
	globalstatus = true,
	icons_enabled = true,
	--
	component_separators = { left = '🮲🮳', right = '' },
	section_separators = { left = '🭠', right = '' },

}

require('lualine').setup {
	options = theme,
}
