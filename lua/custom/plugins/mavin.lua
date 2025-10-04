local settings = require("custom.setting.json").settings()

if not settings.supermaven then
	return {}
end

return {
	event = "BufReadPre",
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
	end,
}
