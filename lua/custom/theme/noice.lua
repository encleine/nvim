local colors = require 'custom.theme.colors'

local hlgroups = {

	NoiceCmdlinePopupTitleCmdline = { fg = colors.pink },
	NoiceCmdlineIconCmdline       = { fg = colors.pink },

	NoiceCmdlinePopupTitleFilter  = { fg = colors.purple },
	NoiceCmdlineIconFilter        = { fg = colors.purple },

	NoiceCmdlinePopupTitleHelp    = { fg = colors.pink },
	NoiceCmdlineIconHelp          = { fg = colors.pink },

	NoiceCmdlinePopupTitleLua     = { fg = colors.aqua },
	NoiceCmdlineIconLua           = { fg = colors.aqua },

	NoiceCmdlinePopupBorderSearch = { fg = colors.white },
	NoiceCmdlinePopupTitleSearch  = { fg = colors.orange },
	NoiceCmdlineIconSearch        = { fg = colors.orange },

	NoiceCmdlineIconInput         = { fg = colors.pink },
	NoiceCmdlineIconCalculator    = { fg = colors.pink },


	NoicePopupmenuSelected = { bg = colors.pink },
	NoiceScrollbar         = { bg = colors.base2 },
	NoiceScrollbarThumb    = { bg = colors.base2 },
}



for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
