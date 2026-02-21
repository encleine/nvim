return function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attacher", { clear = true }),
		callback = function(event)
			local map = function(mod, keys, func, desc)
				vim.keymap.set(mod, keys, func, { buffer = event.buf, desc = desc })
			end

			local function client_supports_method(client, method, bufnr)
				if vim.fn.has("nvim-0.11") == 1 then
					return client:supports_method(method, bufnr)
				else
					return client.supports_method(method, { bufnr = bufnr })
				end
			end

			map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("n", "<leader>ra", vim.lsp.buf.code_action, "[C]ode [A]ction")

			map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			map("n", "<leader>lc", vim.lsp.codelens.run, "[L]SP [C]odeLens Run")

			local client = vim.lsp.get_client_by_id(event.data.client_id)

			if
				client
				and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
			then
				local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
					end,
				})
			end

			if
				client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
			then
				map("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "[T]oggle Inlay [H]ints")
			end
		end,
	})

	local servers = {
		gopls = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			cmd = { "gopls" },

			settings = {
				gopls = {
					gofumpt = true,
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = false,
					symbolMatcher = "Fuzzy",
					vulncheck = "Imports",

					analyses = {
						ST1000 = false, -- "at least one file must define a package"
						ST1003 = false, -- "should not use underscores in package names"
						unusedparams = true,
						unusedwrite = true,
						useany = true,
						shadow = true,
						nilness = true,
					},

					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						rangeVariableTypes = true,
						parameterNames = true,
					},

					codelenses = {
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
				},
			},
		},

		lua_ls = {
			cmd = { "lua-language-server" },

			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},

					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,

			filetypes = { "lua" },
			root_markers = {
				{ ".luarc.json", ".luarc.jsonc" },
				".emmyrc.json",
				".luacheckrc",
				".stylua.toml",
				"stylua.toml",
				"selene.toml",
				"selene.yml",
				".git",
			},
			settings = {
				Lua = {
					hint = {
						enable = true,
						semicolon = "Disable",
					},
				},
			},
		},

		jsonls = {
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},

		yamlls = {
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		},

		vtsls = {
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,

			settings = {
				vtsls = {
					autoUseWorkspaceTsdk = true,
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
			},
		},

		tailwindcss = {
			settings = {
				tailwindCSS = {
					files = {
						exclude = { "node_modules", ".git", ".next", ".cache" },
					},
				},
			},
		},
	}

	local ensure_installed = {
		"black",
		"stylua",
		"goimports",
		"prettierd",
		"sqlfmt",
		"taplo",
		"hadolint",
		"typos",
		"sqlfluff",
		"ruff",
		"dockerls",
		"rust_analyzer",
		"pyright",
		"qmlls",
		"biome",
	}

	local formatters_by_ft = {
		qml = { "qmlls" },
		python = { "black" },
		lua = { "stylua" },
		go = { "goimports" },
		toml = { "taplo" },
		markdown = { "prettierd" },
		sql = { "sqlfmt" },

		jsonc = { "biome-check" },
		json = { "biome-check" },
		css = { "biome-check" },
		typescriptreact = { "biome-check" },
		typescript = { "biome-check" },
		javascriptreact = { "biome-check" },
		javascript = { "biome-check" },
	}

	require("conform").setup({
		formatters_by_ft = formatters_by_ft,
		format_on_save = {
			lsp_format = "never",
			timeout_ms = 500,
		},
	})

	vim.list_extend(ensure_installed, vim.tbl_keys(servers))
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	local capabilities = require("blink.cmp").get_lsp_capabilities()

	vim.lsp.config("*", {
		capabilities = capabilities,
	})

	for server_name, config in pairs(servers) do
		if config ~= nil then
			vim.lsp.config(server_name, config)
		end
	end

	require("mason-lspconfig").setup({
		automatic_enable = {
			exclude = {},
		},
	})
end
