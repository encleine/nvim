return {
	"kdheepak/lazygit.nvim",
	lazy = true,

	dependencies = { "nvim-lua/plenary.nvim" },

	build = "go install github.com/jesseduffield/lazygit@latest",

	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
}
