return {
  'tanvirtin/monokai.nvim',
  config = function()
    local palette = require('custom.theme.base')

    vim.cmd.colorscheme(palette.name)
  end,

  priority = 1000,
}
