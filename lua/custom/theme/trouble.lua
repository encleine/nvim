local palette = require('custom.theme.base')

local hlgroups = {
	-- TroubleDirectory = { fg = colors.aqua },
	TroubleIndent                = { fg = palette.purple },
	TroubleIndentFoldClosed      = { fg = palette.purple },
	TroubleIndentFoldOpen        = { fg = palette.purple },
	TroubleIndentLast            = { fg = palette.purple },
	TroubleIndentMiddle          = { fg = palette.purple },
	TroubleIndentTop             = { fg = palette.purple },
	TroubleIndentWs              = { fg = palette.purple },
	TroubleDiagnosticsItemSource = { fg = palette.purple },
	TroubleNormalNC              = { bg = palette.base2 },
	TroubleNormal                = { bg = palette.base2 },
	TroublePos                   = { fg = palette.pink },
	TroubleCount                 = { fg = palette.pink },
}



for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
