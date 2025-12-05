return {
	"polarmutex/git-worktree.nvim",
	version = "^2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = require("custom.configs.worktrees"),
}
