-- [[ added comment string for sql files ]]
local group = vim.api.nvim_create_augroup('goTabs', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
	callback = function()
		vim.opt["tabstop"] = 4
	end,
	group = group,
	pattern = '*.go',
})
