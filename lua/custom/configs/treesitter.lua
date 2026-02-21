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

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

	vim.filetype.add({
		extension = {
			gotmpl = "gotmpl",
		},
		pattern = {
			[".*/templates/.*%.tpl"] = "gotmpl",
		},
	})
end
