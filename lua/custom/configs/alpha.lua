-- local colors = require('monokai').soda

local fonts = {
	{ 40,  "The_Edge" },
	{ 60,  "THIS" },
	{ 60,  "ANSI_Shadow" },
	{ 60,  "Bloody" },
	{ 120, "broadway" },
	{ 80,  "Chiseled" },
	{ 80,  "delta_corps_priest" },
	{ 80,  "defleppard" },
	{ 70,  "DOS_Rebel" },
	{ 40,  "Elite" },
	{ 80,  "fraktur" },
	{ 80,  "nscript" },
	{ 120, "Patorjk-HeX" },
	{ 100, "Slant_Relief" },
}

local function cwd()
	local mru = require("alpha.themes.theta").mru

	return {
		type = "group",
		val = function()
			return { mru(1, vim.fn.getcwd()) }
		end,
		opts = { shrink_margin = false },
	}
end


local function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

local function header(h)
	h = split(h, "\n")


	return {
		type = "text",
		val = h,
		opts = {
			position = "center",
			hl = "Keyword",
			-- hl = "float",
		},
	}
end

local function mru_title()
	return vim.fn.getcwd()
end

local function padding(p)
	return { type = "padding", val = p, opts = { position = "center", width = 50 }, }
end


local function text(t)
	return { type = "text", val = t, opts = { hl = "SpecialComment", shrink_margin = false, position = "center", width = 50, } }
end



local function figlet()
	math.randomseed(os.clock())

	local font = fonts[math.random(#fonts)]
	local cmd = string.format('figlet -w %d -cf %s "%s" | lolcat', font[1], font[2], "gaming")
	-- local head = io.popen('figlet -w ' .. font[1] .. ' -cf ' .. font[2] .. ' gaming | lolcat', 'r')
	local head = io.popen(cmd, 'r')

	if head then
		head = head.read(head, "*a")
	end

	return head
end


local theta = require("alpha.themes.theta")
theta.config.layout = {
	padding(2),
	header(figlet()),
	padding(2),
	text(mru_title),
	padding(1),
	cwd(),
	padding(1),
}

require 'alpha'.setup(theta.config)
