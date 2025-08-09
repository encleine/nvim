vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		-- NOTE: Remember that Lua is a real programming language, and as such it is possible
		-- to define small helper and utility functions so you don't have to repeat yourself.
		--
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(mod, keys, func, desc)
			vim.keymap.set(mod, keys, func, { buffer = event.buf, desc = desc })
		end


		map("n", '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map("n", '<leader>ra', vim.lsp.buf.code_action, '[C]ode [A]ction')

		map("n", 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')


		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				end,
			})
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("GoOrganizeImports", { clear = true }),
			buffer = event.buf,
			callback = function()
				vim.lsp.buf.code_action({
					context = {
						diagnostics = {},
						only = { "source.organizeImports" },
					},
					apply = true,
					timeout_ms = 500,
				})
			end,
			desc = "Organize Go imports on save",
		})



		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("n", '<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end
	end,
})



local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
	dockerls = {},

	rust_analyzer = {},
	goimports = {},
	gopls = {
		cmd = { 'gopls' },
		settings = {
			gopls = {
				completeUnimported = true,
				staticcheck = true,
				analyses = {
					unusedparams = true,
					fieldalignment = true
				},
			}
		}
	},


	jsonls = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				disable = { 'missing-fields' },
				globals = { "vim" },
			}
		},
	},

	pyright = {},
	biome = {},
	ts_ls = {},
}


local ensure_installed = vim.tbl_keys(servers or {})

vim.list_extend(ensure_installed, {
	'stylua', -- Used to format Lua code
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
	automatic_enable = true,
	ensure_installed = {},
	automatic_installation = false,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
}
