return function()
	local formatters_by_ft = {
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
end
