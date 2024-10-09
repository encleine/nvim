-- fix for lualine being bad
local lualine_nvim_opts = require 'lualine.utils.nvim_opts'
local base_set = lualine_nvim_opts.set

lualine_nvim_opts.set = function(name, val, scope)
	if vim.env.TMUX ~= nil and name == 'statusline' then
		if scope and scope.window == vim.api.nvim_get_current_win() then
			vim.g.tpipeline_statusline = val
			vim.cmd 'silent! call tpipeline#update()'
		end
		return
	end
	return base_set(name, val, scope)
end
