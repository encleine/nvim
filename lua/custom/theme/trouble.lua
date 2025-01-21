local colors = require('monokai').soda

local hlgroups = {
	-- TroubleDirectory = { fg = colors.aqua },
	TroubleIndent                = { fg = colors.purple },
	TroubleIndentFoldClosed      = { fg = colors.purple },
	TroubleIndentFoldOpen        = { fg = colors.purple },
	TroubleIndentLast            = { fg = colors.purple },
	TroubleIndentMiddle          = { fg = colors.purple },
	TroubleIndentTop             = { fg = colors.purple },
	TroubleIndentWs              = { fg = colors.purple },
	TroubleDiagnosticsItemSource = { fg = colors.purple },
	TroubleNormalNC              = { bg = colors.base2 },
	TroubleNormal                = { bg = colors.base2 },
	TroublePos                   = { fg = colors.pink },
	TroubleCount                 = { fg = colors.pink },
}



for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
