local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "pink", { fg = '#f3005f' })
end)

vim.g.rainbow_delimiters = { highlight = "RainbowRed" }

require("ibl").setup {
	indent = { char = "│" },
	whitespace = { remove_blankline_trail = true },
	scope = { highlight = "pink" },
}
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
