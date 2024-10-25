local colors = require('monokai').soda

local theme = {

	theme = {
		inactive = {
			a = { fg = colors.base2, bg = colors.pink, gui = "bold" },
			b = { fg = colors.pink, bg = colors.base0 },
			c = { fg = colors.pink, bg = colors.base2 },
		},
		visual = {
			a = { fg = colors.base2, bg = colors.purple, gui = "bold" },
			b = { fg = colors.purple, bg = colors.base0 },
			c = { fg = colors.purple, bg = colors.base2 },
		},
		replace = {
			a = { fg = colors.base2, bg = colors.purple, gui = "bold" },
			b = { fg = colors.purple, bg = colors.base0 },
			c = { fg = colors.purple, bg = colors.base2 },
		},
		normal = {
			a = { fg = colors.base2, bg = colors.pink, gui = "bold" },
			b = { fg = colors.pink, bg = colors.base0 },
			c = { fg = colors.pink, bg = colors.base2 },
		},
		insert = {
			a = { fg = colors.base2, bg = colors.green, gui = "bold" },
			b = { fg = colors.green, bg = colors.base0 },
			c = { fg = colors.green, bg = colors.base2 },
		},
		command = {
			a = { fg = colors.base2, bg = colors.red, gui = "bold" },
			b = { fg = colors.red, bg = colors.base0 },
			c = { fg = colors.red, bg = colors.base2 },
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
