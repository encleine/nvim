return {
  'tanvirtin/monokai.nvim',
  config = function()
    require('monokai').setup { palette = require('monokai').soda, italics = false }
    require('monokai').setup { palette = { base2 = '#191919' } }
  end,

  -- "nyoom-engineering/oxocarbon.nvim",
  -- config = function() vim.cmd.colorscheme 'oxocarbon' end,
  priority = 1000,
}
