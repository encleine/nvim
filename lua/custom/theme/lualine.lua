local palette = require('custom.theme.base').palette

return {
	theme = {
		inactive = {
			a = { fg = palette.base2 or palette.base, bg = palette.pink, gui = "bold" },
			b = { fg = palette.pink, bg = palette.base0 or palette.base },
			c = { fg = palette.pink, bg = palette.base2 or palette.base },
		},
		visual = {
			a = { fg = palette.base2 or palette.base, bg = palette.purple, gui = "bold" },
			b = { fg = palette.purple, bg = palette.base0 or palette.base },
			c = { fg = palette.purple, bg = palette.base2 or palette.base },
		},
		replace = {
			a = { fg = palette.base2 or palette.base, bg = palette.purple, gui = "bold" },
			b = { fg = palette.purple, bg = palette.base0 or palette.base },
			c = { fg = palette.purple, bg = palette.base2 or palette.base },
		},
		normal = {
			a = { fg = palette.base2 or palette.base, bg = palette.pink, gui = "bold" },
			b = { fg = palette.pink, bg = palette.base0 or palette.base },
			c = { fg = palette.pink, bg = palette.base2 or palette.base },
		},
		insert = {
			a = { fg = palette.base2 or palette.base, bg = palette.green, gui = "bold" },
			b = { fg = palette.green, bg = palette.base0 or palette.base },
			c = { fg = palette.green, bg = palette.base2 or palette.base },
		},
		command = {
			a = { fg = palette.base2 or palette.base, bg = palette.red, gui = "bold" },
			b = { fg = palette.red, bg = palette.base0 or palette.base },
			c = { fg = palette.red, bg = palette.base2 or palette.base },
		},
	},

	always_divide_middle = true,
	globalstatus = true,
	icons_enabled = true,
	--
	component_separators = { left = '🮲🮳', right = '' },
	section_separators = { left = '🭠', right = '' },
}
