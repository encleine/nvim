local palette = require('custom.theme.base')

local borderBg = palette.base2
local selection = palette.base0
local border = { bg = borderBg, fg = palette.base8 }
local backGround = { bg = borderBg }

local hlgroups = {
	TelescopeSelection = { fg = palette.white, bg = selection, bold = true },
	TelescopePromptPrefix = { bg = borderBg, fg = palette.green },
	TelescopeMatching = { fg = palette.pink, bold = true },

	TelescopePromptNormal = backGround,
	TelescopePreviewNormal = backGround,
	TelescopeResultsNormal = backGround,
	TelescopeNormal = backGround,

	TelescopePromptTitle = { bg = borderBg, fg = palette.pink },
	TelescopeResultsTitle = { bg = borderBg, fg = palette.orange },
	TelescopePreviewTitle = { bg = borderBg, fg = palette.purple },

	TelescopePromptBorder = border,
	TelescopeResultsBorder = border,
	TelescopePreviewBorder = border,
	TelescopeBorder = border,

	Folded = { bg = palette.base1, fg = palette.pink },
}

for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
