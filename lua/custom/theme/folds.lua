local function tabs_to_spaces(text)
	-- Replace leading tabs with 4 spaces
	local converted_text = text:gsub("^\t+", function(tabs)
		return string.rep("    ", #tabs)
	end)
	return converted_text
end

function _G.FoldText()
	local start = vim.fn.getline(vim.v.foldstart)
	return tabs_to_spaces(start) .. " .. " .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldtext = 'v:lua.FoldText()'
vim.opt.fillchars:append({ fold = " " })