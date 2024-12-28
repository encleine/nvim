local colors = require('monokai').soda

local hlgroups = {
	LazyBackdrop = { bg = colors.base2 },
}

for hl, col in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hl, col)
end
