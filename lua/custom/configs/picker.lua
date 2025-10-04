return {
	theme_picker = function()
		-- ALL Telescope requires moved inside this function
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		-- The other local requires can also be moved here
		local settings = require("custom.setting.json")
		local palettes = require("custom.theme.base").palettes
		local monokai = require("monokai")
		local catppuccin = require("catppuccin")

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

							local saved_palette = settings.palette()
							if saved_palette and selection.display == saved_palette.name then
								return
							end

							monokai.setup({})
							catppuccin.setup({})

							vim.fn.system(
								string.format(
									"cat ~/.config/ghostty/themes/%s > ~/.config/ghostty/themes/curent-theme.conf",
									selection.ordinal
								)
							)

							local palette = palettes[selection.display]
							if palette.theme == "monokai" then
								monokai.setup({ palette = palette, italics = false })
								vim.cmd.colorscheme(palette.name)
							else
								catppuccin.setup({ flavour = selection.display })
								vim.cmd.colorscheme("catppuccin")
							end

							settings.save_palette(palette)
							local hooks = require("ibl.hooks")
							hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
								vim.api.nvim_set_hl(0, "blankLine_scope_pink", { fg = palette.pink })
							end)

							vim.cmd("silent! call tpipeline#state#reload()")
							require("custom.configs.lualine").setup(palette)
						end)
						return true
					end,

					finder = finders.new_table({
						results = settings.settings().palettes,
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
