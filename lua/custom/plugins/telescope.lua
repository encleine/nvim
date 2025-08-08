return {
	'nvim-telescope/telescope.nvim',
	-- branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},

	cmd = 'Telescope',
	keys = {
		{ '<leader><space>', '<cmd>Telescope buffers<cr>',                       desc = '[ ] Find existing buffers' },
		{ '<leader>/',       '<cmd>Telescope current_buffer_fuzzy_find<cr>',     desc = '[/] Fuzzily search in current buffer' },
		{ '<leader>gb',      '<cmd>Telescope git_branches<cr>',                  desc = 'Search [G]it [B]branches' },
		{ '<leader>gd',      '<cmd>Telescope git_status<cr>',                    desc = 'Search [G]it [D]if Files' },
		{ '<leader>ff',      '<cmd>Telescope find_files<cr>',                    desc = '[F]ind [F]iles' },
		{ '<leader>sg',      '<cmd>Telescope live_grep<cr>',                     desc = ' [S]earch using live [G]rep' },
		{ '<leader>ss',      '<cmd>Telescope lsp_document_symbols<cr>',          desc = '[S]earch [S]ymbols' },
		{ '<leader>sw',      '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = '[S]earch [W]orkspace' },
		{ 'gr',              '<cmd>Telescope lsp_references<cr>',                desc = '[G]oto [R]eferences' },
		{
			'<leader>st',
			require('custom.configs.picker').theme_picker,
			desc = ' [S]earch [T]hemes'
		},
	},

	lazy = true,
	config = function() require 'custom.configs.telescope' end
}
