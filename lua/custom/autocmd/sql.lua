-- [[ added comment string for sql files ]]
local highlight_group = vim.api.nvim_create_augroup('sqlComment', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		vim.bo.commentstring = '-- %s'
	end,
	group = highlight_group,
	pattern = 'sql',
})
