return function()
	require("nvim-treesitter").install({
		"go",
		"lua",
		"tsx",
		"typescript",
		"sql",
		"html",
		"css",
		"json",
		"svelte",
		"markdown",
		"dockerfile",
		"yaml",
	})

	-- Diagnostic keymaps
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
	-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

	vim.filetype.add({
		extension = {
			gotmpl = "gotmpl",
		},
		pattern = {
			[".*/templates/.*%.tpl"] = "gotmpl",
		},
	})
end
