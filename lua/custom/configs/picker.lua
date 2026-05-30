return {
	theme_picker = function()
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local theme = require("custom.theme")

		local colors = function(opts)
			opts = opts or {}
			pickers
				.new(opts, {
					prompt_title = "themes",
					sorter = conf.generic_sorter(opts),
					attach_mappings = function(prompt_bufnr, _)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)

							local selection = action_state.get_selected_entry()
							if not selection then
								return
							end

							local saved = require("custom.setting.json").palette()
							if saved and selection.display == saved.name then
								return
							end

							theme.apply(selection.display, selection.ordinal)
						end)
						return true
					end,

					finder = finders.new_table({
						results = theme.list(),
						entry_maker = function(entry)
							return {
								value = entry,
								display = entry[1],
								ordinal = entry[2],
								type = "theme",
							}
						end,
					}),
				})
				:find()
		end
		colors(require("telescope.themes").get_dropdown({}))
	end,
}
