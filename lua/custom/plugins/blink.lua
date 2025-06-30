return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<tab>"] = { 'select_and_accept', 'fallback' },
      ["<enter>"] = { 'select_and_accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-e>'] = { 'cancel', 'show', 'fallback' },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    signature = { enabled = true },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },

      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      -- add vim-dadbod-completion to your completion providers
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },

  opts_extend = { "sources.default" }
}
