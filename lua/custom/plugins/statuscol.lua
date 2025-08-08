return {
	"luukvbaal/statuscol.nvim",

	event = 'BufReadPre',
	config = function() require 'custom.configs.statuscol' end
}
