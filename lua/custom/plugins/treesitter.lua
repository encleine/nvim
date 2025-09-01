return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"nvim-treesitter/nvim-treesitter-context",
			event = "BufReadPre",
			opts = function()
				local tsc = require("treesitter-context")
				Snacks.toggle({
					name = "Treesitter Context",
					get = tsc.enabled,
					set = function(state)
						if state then
							tsc.enable()
						else
							tsc.disable()
						end
					end,
				}):map("<leader>ut")
				return { mode = "cursor", max_lines = 3 }
			end,
		},
	},

	-- event = 'BufReadPre',
	build = ":TSUpdate",
	config = function()
		require("custom.configs.treesitter")
	end,
}
