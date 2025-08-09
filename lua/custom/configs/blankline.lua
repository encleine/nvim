local settings = require('custom.setting.json').settings
local palette = settings.palette
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "blankLine_scope_pink", { fg = palette.pink })
end)

vim.g.rainbow_delimiters = { highlight = "RainbowRed" }

require("ibl").setup {
	-- indent = { char = "│" },
	indent = {
		char = "┇",
	},
	-- indent = { char = "" },
	whitespace = { remove_blankline_trail = true },
	scope = {
		highlight = "blankLine_scope_pink",
		char = "┃"
	},
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
