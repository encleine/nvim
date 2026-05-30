return function()
	local theme = require("custom.theme")
	local hooks = require("ibl.hooks")
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		if theme.current_pink then
			vim.api.nvim_set_hl(0, "blankLine_scope_pink", { fg = theme.current_pink })
		end
	end)

	require("ibl").setup({
		indent = {
			char = "┇",
		},
		-- indent = { char = "" },
		whitespace = { remove_blankline_trail = true },
		scope = {
			highlight = "blankLine_scope_pink",
			char = "┃",
		},
	})

	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
