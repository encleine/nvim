local on_attach = function(_, bufnr)
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	local imap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
	end


	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

	imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.

local servers = {
	dockerls = {},

	rust_analyzer = {},
	gopls = {
		cmd = { 'gopls' },
		settings = {
			gopls = {
				completeUnimported = true,
				staticcheck = true,
				analyses = {
					unusedparams = true,
					fieldalignment = true
				}
			}
		}
	},

	jsonls = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { disable = { 'missing-fields' } }
		},
	},

	pyright = { capabilities = capabilities }
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			}
		end
	}
}
