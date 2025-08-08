local DropDownThem = { winblend = 10 }
local NoPreview = { theme = "dropdown", winblend = 10, previewer = false }
local actions = require "telescope.actions"

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
			},
		},
	},

	pickers = {
		find_files = NoPreview,
		current_buffer_fuzzy_find = DropDownThem,
		git_branches = NoPreview,
		live_grep = DropDownThem,
		buffers = DropDownThem,
		git_status = DropDownThem,
		lsp_document_symbols = DropDownThem,
		lsp_dynamic_workspace_symbols = DropDownThem,
	},
	extensions = {
		fzf = {},
	},
}

-- Enable telescope fzf native, if installed
require('telescope').load_extension('fzf')
