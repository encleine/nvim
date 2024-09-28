require("oil").setup {
	default_file_explorer = true,
	columns = { "icon" },
	view_options = {
		show_hidden = true
	},
	keymaps = {
		["<C-s>"] = false,
		["<C-h>"] = false,
		["<C-l>"] = false,
	}
}

vim.keymap.set("n", "<space>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
