-- [[ Highlight on yank ]]
local group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.hl.on_yank { timeout = 200, higroup = "lualine_a_visual" }
	end,
	group = group,
	pattern = '*',
})
