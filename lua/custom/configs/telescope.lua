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

local builtin = require('telescope.builtin')
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]branches' })
vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Search [G]it [D]if Files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>sw', builtin.lsp_dynamic_workspace_symbols, { desc = '[S]earch [W]orkspace' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = ' [S]earch using live [G]rep' })
