return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = "BufReadPre",
	config = function()
		local settings = require("custom.setting.json").settings()
		if not settings then
			return
		end

		local selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		}

		local keymaps = {

			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",

			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
		}

		if not settings.experimental then
			keymaps = {}
			selection_modes = {}
		end

		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

				-- experimental
				keymaps = keymaps,
				selection_modes = selection_modes,
				include_surrounding_whitespace = false,
			},
			swap = {
				enable = true,
				swap_next = { ["<leader>a"] = "@parameter.inner" },
				swap_previous = { ["<leader>A"] = "@parameter.inner" },
			},
		})
	end,
}
