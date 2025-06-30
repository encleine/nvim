return {
  'christoomey/vim-tmux-navigator',
  -- Git related plugins
  'tpope/vim-fugitive',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  "lukas-reineke/cmp-under-comparator",
  "nvim-neotest/nvim-nio",
  -- show pending keybinds.
  'folke/which-key.nvim',

  'lukas-reineke/indent-blankline.nvim',

  "luukvbaal/statuscol.nvim",


  { 'vimpostor/vim-tpipeline', event = 'VeryLazy' },

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  }
}
