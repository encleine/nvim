-- [[ options ]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
-- Enable relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors = true

-- Changed tab size
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4


vim.wo.foldmethod = 'expr'
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'


-- fold optios
vim.o.foldcolumn = '2'

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
