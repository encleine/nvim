local latte_pallete = require("catppuccin.palettes").get_palette "latte"
local mocha_pallete = require("catppuccin.palettes").get_palette "mocha"
local frappe_pallete = require("catppuccin.palettes").get_palette "frappe"
local macchiato_pallete = require("catppuccin.palettes").get_palette "macchiato"


local palettes = {
	latte = vim.tbl_deep_extend('keep', latte_pallete, { name = "latte" }),
	mocha = vim.tbl_deep_extend('keep', mocha_pallete, { name = "mocha" }),
	frappe = vim.tbl_deep_extend('keep', frappe_pallete, { name = "frappe" }),
	macchiato = vim.tbl_deep_extend('keep', macchiato_pallete, { name = "macchiato" }),
	soda = require('monokai').soda,
	pro = require('monokai').pro,
	classic = require('monokai').classic,
	ristretto = require('monokai').ristretto,
}

local settings = require('custom.setting.json')
local palette = palettes[settings.settings.palette]


return {
	palettes = palettes,
	palette = palette
}
