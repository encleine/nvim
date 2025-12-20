vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
	pattern = { "*.go", "*.mod" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
	group = vim.api.nvim_create_augroup("codelenses", { clear = true }),
})
