return {
	setup = function(opts)
		opts = opts or nil
		-- fix for lualine being bad
		local lualine_nvim_opts = require("lualine.utils.nvim_opts")
		local base_set = lualine_nvim_opts.set

		lualine_nvim_opts.set = function(name, val, scope)
			if vim.env.TMUX ~= nil and name == "statusline" then
				if scope and scope.window == vim.api.nvim_get_current_win() then
					vim.g.tpipeline_statusline = val
					vim.cmd("silent! call tpipeline#update()")
				end
				return
			end
			return base_set(name, val, scope)
		end

		require("lualine").setup({

			sections = {
				lualine_b = { "branch", "location" },
				lualine_c = { "selectioncount" },
				lualine_x = {
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
					},
				},
				lualine_y = { "" },
				lualine_z = { "" },
			},

			extensions = {
				"oil",
				"fugitive",
				"mason",
				"lazy",
				"trouble",
			},

			options = require("custom.theme.lualine").options(opts),
		})
	end,
}
