require("oil").setup({
	watch_for_changes = true,
	default_file_explorer = true,
	columns = { "icon" },
	view_options = {
		show_hidden = true,
	},
	delete_to_trash = true,
	keymaps = {
		["<C-s>"] = false,
		["<C-h>"] = false,
		["<C-l>"] = false,
	},
})
