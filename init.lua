-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true

---@diagnostic disable-next-line: lowercase-global
diagnostics = { disable = { 'missing-fields' } }

-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Custom plugins ]]
--    [[ todoComments ]]
--    [[ bufferline ]]
--    [[ autoformat ]]
--    [[ treesitter ]]
--    [[ colorizer ]]
--    [[ telescope ]]
--    [[ gitsigns ]]
--    [[ nvim-cmp ]]
--    [[ lualine ]]
--    [[ dadbod ]]
--    [[ noice ]]
--    [[ alpha ]]
--    [[ theme ]]
--    [[ init ]]
--    [[ lsp ]]
--    [[ oil ]]
require('lazy').setup({
  import = 'custom.plugins',
  change_detection = { notify = false },
})

-- [[ Setting options ]]
--    [[  options ]]
--    [[  Keymaps ]]
require 'custom.setting'

-- [[ Custom plugin Configs ]]
--    [[ bufferline ]]
--    [[ treesitter ]]
--    [[ blankline ]]
--    [[ statuscol ]]
--    [[ telescope ]]
--    [[ nvim-cmp ]]
--    [[ lualine ]]
--    [[ alpha ]]
--    [[ lsp ]]
--    [[ oil ]]
require 'custom.configs'

-- [[ Custome theming ]]
--   [[ telescope ]]
--   [[ lueline ]]
--   [[ noice ]]
--   [[ folds ]]
require 'custom.theme'

-- [[ Custome theming ]]
--   [[ go -> sql ]]
require 'custom.injectors'

-- [[ Custome auto cmds ]]
--   [[ sql comment string ]]
--   [[ Highlight on yank ]]
require 'custom.autocmd'


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
