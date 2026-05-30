require("custom.theme.folds")

local cat_variants = {
	latte = "catppuccin-latte.conf",
	frappe = "catppuccin-frappe.conf",
	macchiato = "catppuccin-macchiato.conf",
	mocha = "catppuccin-mocha.conf",
}

local monokai_variants = {
	monokai = { variant = "classic", conf = "monokai-classic.conf" },
	monokai_soda = { variant = "soda", conf = "monokai-soda.conf" },
	monokai_pro = { variant = "pro", conf = "monokai-pro.conf" },
	monokai_ristretto = { variant = "ristretto", conf = "monokai-ristretto.conf" },
}

local M = {}
local palette_cache = {}

---@type string|nil
M.current_pink = nil

---Initialize current_pink from saved palette
local ok, json = pcall(require, "custom.setting.json")
if ok then
	local saved = json.palette()
	if saved then
		M.current_pink = saved.pink
	end
end

function M.palette(name)
	if palette_cache[name] then
		return palette_cache[name]
	end

	local p

	local ok, catppuccin = pcall(require, "catppuccin.palettes")
	if ok and cat_variants[name] then
		local cp = catppuccin.get_palette(name)
		p = vim.tbl_deep_extend("keep", cp, { name = name, theme = "catppuccin" })
	end

	if not p then
		local ok, monokai = pcall(require, "monokai")
		if ok then
			local info = monokai_variants[name]
			if info and monokai[info.variant] then
				p = vim.tbl_deep_extend("keep", monokai[info.variant], { theme = "monokai" })
			end
		end
	end

	palette_cache[name] = p
	return p
end

function M.list()
	local entries = {}
	for name, conf in pairs(cat_variants) do
		entries[#entries + 1] = { name, conf }
	end
	for name, info in pairs(monokai_variants) do
		entries[#entries + 1] = { name, info.conf }
	end
	return entries
end

function M.apply(name, ordinal)
	local palette = M.palette(name)
	if not palette then
		vim.notify("Unknown palette: " .. name, vim.log.levels.ERROR)
		return
	end

	pcall(function()
		require("monokai").setup({})
	end)
	pcall(function()
		require("catppuccin").setup({})
	end)

	if ordinal then
		local home = vim.fn.expand("$HOME")
		local src = home .. "/.config/ghostty/themes/" .. ordinal
		local dst = home .. "/.config/ghostty/themes/current-theme.conf"
		vim.fn.system(string.format("cat '%s' > '%s'", src, dst))
		vim.fn.system("pkill -SIGUSR2 ghostty;")
	end

	M.current_pink = palette.pink

	if palette.theme == "monokai" then
		require("monokai").setup({ palette = palette, italics = false })
		vim.cmd.colorscheme(palette.name)
	else
		require("catppuccin").setup({ flavour = name })
		vim.cmd.colorscheme("catppuccin")
	end

	vim.api.nvim_set_hl(0, "LspCodeLens", { fg = palette.green, italic = true })
	vim.api.nvim_set_hl(0, "blankLine_scope_pink", { fg = palette.pink })

	require("custom.setting.json").save_palette(palette)

	vim.cmd("silent! call tpipeline#state#reload()")
	require("custom.configs.lualine").setup(palette)
end

return M
