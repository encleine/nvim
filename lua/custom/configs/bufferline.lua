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
		table.insert(result, { text = " \u{f1a3f} " .. status.changed, fg = palette.aqua or palette.blue })
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
	local seve = vim.diagnostic.severity
	local error = #vim.diagnostic.get(nil, { severity = seve.ERROR })
	local warning = #vim.diagnostic.get(nil, { severity = seve.WARN })
	local info = #vim.diagnostic.get(nil, { severity = seve.INFO })
	local hint = #vim.diagnostic.get(nil, { severity = seve.HINT })

	if error ~= 0 then
		table.insert(result, { text = " \u{ea87} " .. error, fg = palette.red })
	end

	if warning ~= 0 then
		table.insert(result, { text = "  " .. warning, fg = palette.orange })
	end

	if hint ~= 0 then
		table.insert(result, { text = "  " .. hint, fg = palette.green })
	end

	if info ~= 0 then
		table.insert(result, { text = " \u{f449} " .. info, fg = palette.aqua or palette.blue })
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
