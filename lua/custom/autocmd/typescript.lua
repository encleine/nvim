-- [[ added comment string for sql files ]]
local group = vim.api.nvim_create_augroup('tsTabs', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
	callback = function()
		vim.opt["expandtab"] = true
		vim.opt["tabstop"] = 2
		vim.opt["shiftwidth"] = 2
	end,
	group = group,
	pattern = { '*.ts', "*.tsx", '*.jsx', "*.js" },
})
