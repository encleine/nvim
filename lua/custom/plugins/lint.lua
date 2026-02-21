return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft["sql"] = { "sqlfluff" }
		lint.linters_by_ft["python"] = { "ruff" }
		lint.linters_by_ft["json"] = { "biomejs" }

		lint.linters_by_ft["javascript"] = { "biomejs" }
		lint.linters_by_ft["javascriptreact"] = { "biomejs" }
		lint.linters_by_ft["typescript"] = { "biomejs" }
		lint.linters_by_ft["typescriptreact"] = { "biomejs" }

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if vim.bo.modifiable then
					lint.try_lint()
					lint.try_lint("typos")
				end
			end,
		})
	end,
}
