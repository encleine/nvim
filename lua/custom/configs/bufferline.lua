return function()
	local palette = require("custom.setting.json").palette()
	local git = require("custom.functions.git")

	local function GitStatus(result)
		local status = git.Get_git_repo_status()
		if not status then
			return result
		end

		if status.added ~= 0 then
			table.insert(result, { text = " \u{f0ef0} " .. status.added, fg = palette.green })
		end

		if status.changed ~= 0 then
			table.insert(result, { text = " \u{f1a3f} " .. status.changed, fg = palette.yellow })
		end

		if status.removed ~= 0 then
			table.insert(result, { text = " \u{f0234} " .. status.removed, fg = palette.red })
		end

		if status.untracked ~= 0 then
			table.insert(result, { text = " \u{f4e8} " .. status.untracked, fg = palette.red })
		end

		return result
	end

	local function right()
		local result = {}

		local counts = vim.diagnostic.count() or {}

		local diags = {
			{ val = counts[vim.diagnostic.severity.ERROR] or 0, icon = " \u{ea87} ", color = palette.red },
			{ val = counts[vim.diagnostic.severity.WARN] or 0, icon = "  ", color = palette.yellow },
			{ val = counts[vim.diagnostic.severity.HINT] or 0, icon = "  ", color = palette.green },
			{
				val = counts[vim.diagnostic.severity.INFO] or 0,
				icon = " \u{f449} ",
				color = palette.aqua or palette.blue,
			},
		}

		for _, d in ipairs(diags) do
			if d.val > 0 then
				table.insert(result, { text = d.icon .. d.val, fg = d.color })
			end
		end

		return GitStatus(result)
	end

	require("bufferline").setup({
		options = {
			mode = "tabs",
			-- buffer_close_icon = '',
			themable = true,

			-- tabline_position = "bottom", -- This is a custom option, change the position here
			indicator = { style = "none" },

			diagnostics = "nvim_lsp",

			show_buffer_close_icons = false,
			show_close_icon = false,
			show_duplicate_prefix = false,
			custom_areas = { right = right },
			separator_style = { "", "" },
		},

		highlights = {
			fill = {
				---@diagnostic disable-next-line: assign-type-mismatch
				bg = {
					attribute = "bg",
					highlight = "Whitespace",
				},
			},
			background = {
				---@diagnostic disable-next-line: assign-type-mismatch
				bg = {
					attribute = "bg",
					highlight = "Whitespace",
				},
			},
		},
	})
end
