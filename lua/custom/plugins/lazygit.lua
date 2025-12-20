return {
	"kdheepak/lazygit.nvim",
	lazy = true,

	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	build = "go install github.com/jesseduffield/lazygit@latest",

	config = function()
		require("telescope").load_extension("lazygit")
	end,

	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}
