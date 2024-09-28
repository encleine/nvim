local DropDownThem = { winblend = 10 }
local NoPreview = { theme = "dropdown", winblend = 10, previewer = false }

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},

	pickers = {
		find_files = NoPreview,
		current_buffer_fuzzy_find = NoPreview,
		git_branches = NoPreview,
		buffers = DropDownThem,
		git_status = DropDownThem,
		lsp_document_symbols = DropDownThem,
		lsp_dynamic_workspace_symbols = DropDownThem,
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]branches' })
vim.keymap.set('n', '<leader>gd', builtin.git_status, { desc = 'Search [G]it [D]if Files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = '[S]earch [S]ymbols' })