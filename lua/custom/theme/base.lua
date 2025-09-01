local settings = require("custom.setting.json").settings
local palette = settings.palette

local monokai = require("monokai")

local latte_pallete = require("catppuccin.palettes").get_palette("latte")
local mocha_pallete = require("catppuccin.palettes").get_palette("mocha")
local frappe_pallete = require("catppuccin.palettes").get_palette("frappe")
local macchiato_pallete = require("catppuccin.palettes").get_palette("macchiato")

local palettes = {
	latte = vim.tbl_deep_extend("keep", latte_pallete, { name = "latte", theme = "catppuccin" }),
	mocha = vim.tbl_deep_extend("keep", mocha_pallete, { name = "mocha", theme = "catppuccin" }),
	frappe = vim.tbl_deep_extend("keep", frappe_pallete, { name = "frappe", theme = "catppuccin" }),
	macchiato = vim.tbl_deep_extend("keep", macchiato_pallete, { name = "macchiato", theme = "catppuccin" }),

	monokai_soda = vim.tbl_deep_extend("keep", monokai.soda, { theme = "monokai" }),
	monokai_pro = vim.tbl_deep_extend("keep", monokai.pro, { theme = "monokai" }),
	monokai = vim.tbl_deep_extend("keep", monokai.classic, { theme = "monokai" }),
	monokai_ristretto = vim.tbl_deep_extend("keep", monokai.ristretto, { theme = "monokai" }),
}

return {
	palettes = palettes,
	palette = palette,
}
