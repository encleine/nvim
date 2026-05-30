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
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter.setup", {}),
		callback = function(args)
			local buf = args.buf
			local filetype = args.match

			local language = vim.treesitter.language.get_lang(filetype) or filetype
			if not vim.treesitter.language.add(language) then
				return
			end

			vim.treesitter.start(buf, language)
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end
