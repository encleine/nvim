return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',



    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',    opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'saghen/blink.cmp'
  },
}
