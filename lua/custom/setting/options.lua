-- Set highlight on search
vim.o.hlsearch                    = false

-- Make line numbers default
vim.wo.number                     = true
-- Enable relative line numbers
vim.wo.relativenumber             = true

-- Enable mouse mode
vim.o.mouse                       = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard                   = 'unnamedplus'

-- Enable break indent
vim.o.breakindent                 = true

-- Save undo history
vim.o.undofile                    = true
vim.o.wrap                        = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase                  = true
vim.o.smartcase                   = true

-- Keep signcolumn on by default
vim.o.signcolumn                  = 'yes'

-- Decrease update time
vim.o.updatetime                  = 250
vim.o.timeoutlen                  = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt                 = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors               = true

-- Changed tab size
vim.o.shiftwidth                  = 4
vim.o.softtabstop                 = 4
vim.o.tabstop                     = 4
-- expandtab sw=4 sts=4
vim.opt["tabstop"]                = 4
vim.opt["shiftwidth"]             = 4
vim.expandtab                     = true

-- fold optios
vim.o.foldcolumn                  = '2'

vim.o.foldlevel                   = 99
vim.o.foldlevelstart              = 99
vim.o.foldenable                  = true

vim.g.tpipeline_clearstl          = 1
vim.o.showmode                    = false

-- vim.g.omni_sql_default_compl_type = 'syntax'
vim.g.ftplugin_sql_omni_key       = '<C-0>'
vim.g.ftplugin_sql_omni_key_right = '<C-0>'
vim.g.ftplugin_sql_omni_key_left  = '<C-0>'

-- vim.g._ts_force_sync_parsing      = true

-- vim.opt.clipboard                 = "unnamedplus"

vim.diagnostic.config({
	virtual_text = { current_line = false },
	underline = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '┃',
			[vim.diagnostic.severity.WARN]  = '┃',
			[vim.diagnostic.severity.INFO]  = '┃',
			[vim.diagnostic.severity.HINT]  = '┃',
		},
	},
})
