local function header()
	local art = require("custom.theme.art")[3]

	return string.format(
		[[
		if ! command -v lolcat &> /dev/null
		then 
			echo "%s"
		else 
			echo "%s" | lolcat
		fi 
	]],
		art,
		art
	)
end

require("snacks").setup({
	notifier = { enabled = true },
	dashboard = {
		enabled = true,
		width = 85,
		formats = {
			key = function()
				return {}
			end,
		},
		sections = {
			{
				pane = 2,
				section = "terminal",
				cmd = header(),
				height = 9,
				padding = 1,
				align = "center",
			},

			{
				icon = " ",
				title = "Recent Files",
				section = "recent_files",
				indent = 2,
				padding = 1,
				cwd = true,
			},
			{
				icon = " ",
				title = "Git Status",
				section = "terminal",
				enabled = function()
					return Snacks.git.get_root() ~= nil
				end,
				cmd = "git status --short --branch --renames",
				height = 5,
				padding = 1,
				ttl = 5 * 60,
				indent = 2,
			},
			{
				pane = 2,
				section = "startup",
			},
		},
	},
})
