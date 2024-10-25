local colors = require('monokai').soda

local borderBg = colors.base2
local selection = colors.base0
local border = { bg = borderBg, fg = colors.base8 }
local backGround = { bg = borderBg }

local hlgroups = {
	TelescopeSelection = { fg = colors.white, bg = selection, bold = true },
	TelescopePromptPrefix = { bg = borderBg, fg = colors.green },
	TelescopeMatching = { fg = colors.pink, bold = true },

	TelescopePromptNormal = backGround,
	TelescopePreviewNormal = backGround,
	TelescopeResultsNormal = backGround,
	TelescopeNormal = backGround,

	TelescopePromptTitle = { bg = borderBg, fg = colors.pink },
	TelescopeResultsTitle = { bg = borderBg, fg = colors.orange },
	TelescopePreviewTitle = { bg = borderBg, fg = colors.purple },

	TelescopePromptBorder = border,
	TelescopeResultsBorder = border,
	TelescopePreviewBorder = border,
	TelescopeBorder = border,

	Folded = { bg = colors.base1, fg = colors.pink },
}

for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
