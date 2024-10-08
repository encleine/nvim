-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank { timeout = 200, higroup = "IncSearch" }
	end,
	group = highlight_group,
	pattern = '*',
})
