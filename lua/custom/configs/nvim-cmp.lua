local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}


cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),

		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},

		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},


	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = 'vim-dadbod-completion' },
		{ name = 'buffer' },
	}
})


local lspkind = require('lspkind')
cmp.setup {
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,

			ellipsis_char = '...',
			show_labelDetails = true,

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization.
			-- before = function (entry, vim_item) return vim_item end
		})
	}
}
