local palette = require('custom.theme.base')

local hlgroups = {
	LazyBackdrop = { bg = palette.base2 },
}

for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
