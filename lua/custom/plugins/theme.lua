return {
  'tanvirtin/monokai.nvim',
  config = function()
    local palette = require('monokai').soda
    palette.base2 = '#191919'

    require('monokai').soda = palette
    require('monokai').setup { palette = palette, italics = false }

    vim.cmd.colorscheme 'monokai_soda'
  end,

  -- "nyoom-engineering/oxocarbon.nvim",
  -- config = function() vim.cmd.colorscheme 'oxocarbon' end,
  priority = 1000,
}
