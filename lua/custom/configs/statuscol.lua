local ffi = require("ffi")
local C = ffi.C

ffi.cdef([[
	typedef struct {} win_T;
	typedef struct {
		int start;  // line number where deepest fold starts
		int level;  // fold level, when zero other fields are N/A
		int llevel; // lowest level that starts in v:lnum
		int lines;  // number of lines from v:lnum to end of closed fold
	} foldinfo_T;
	foldinfo_T fold_info(win_T* wp, int lnum);
]])


local function fold_info(args)
	local lnum = args.lnum
	local currFold = C.fold_info(args.wp, lnum)
	local nextFold = C.fold_info(args.wp, lnum + 1)


	return {
		level = currFold.level,
		closed = currFold.lines > 0,
		start = currFold.start == lnum,
		last = nextFold.start == lnum + 1 and nextFold.level <= currFold.level or nextFold.level == 0,
	}
end

-- INFO: WIP
-- local soda = require('monokai').soda
-- local classic = require('monokai').classic
-- local pro = require('monokai').pro
-- local ristretto = require('monokai').ristretto
--
-- local colors = {
-- 	["ristretto-red"] = { fg = ristretto.red, ctermfg = 35 },
-- 	["ristretto-pink"] = { fg = ristretto.pink, ctemrfg = 35 },
-- 	["classic-red"] = { fg = classic.red, ctemrfg = 35 },
-- 	["classic-pink"] = { fg = classic.pink, ctemrfg = 35 },
-- 	["soda-red"] = { fg = soda.red, ctemrfg = 35 },
-- 	["pro-red"] = { fg = pro.red, ctemrfg = 35 },
-- 	["pro-pink "] = { fg = pro.pink, ctemrfg = 35 },
-- }
--
-- local highlights = {}
-- for key, color in pairs(colors) do
-- 	local name = "FOLD" .. key
-- 	vim.api.nvim_set_hl(0, name, color)
-- 	highlights[key] = name
-- end


local function foldfunc(args)
	local width = args.fold.width
	if width == 0 then return "" end

	local fold = fold_info(args)
	local sep = "%#ErrorMsg#"
	local level = fold.level
	local closed = fold.closed
	local range = level < width and level or width
	local start = fold.start

	if level == 0 then
		return (" "):rep(width) .. "%*"
	end

	if closed and level == 1 then
		-- sep = sep .. "🮯"
		sep = sep .. "🯀"
	elseif closed then
		sep = sep .. "┇"
	elseif start and level == 1 then
		sep = sep .. "┏"
	elseif start then
		sep = sep .. "┣"
	elseif fold.last and level == 1 then
		sep = sep .. "┗"
	else
		sep = sep .. "┃"
	end

	if range < width then
		sep = sep .. (" "):rep(width - range)
	end

	return sep .. "%*"
end

local builtin = require("statuscol.builtin")

local function lnumfunc(args, segment)
	if args.sclnu and segment.sign and segment.sign.wins[args.win].signs[args.lnum] then
		return "%=" .. builtin.signfunc(args, segment)
	end
	if not args.rnu and not args.nu then return "" end
	if args.virtnum ~= 0 then return "%=" end

	local lnum = args.rnu and (args.relnum > 0 and args.relnum or (args.nu and args.lnum or 0)) or args.lnum
	local sep = "%=" .. lnum

	if args.rnu and args.relnum <= 0 and args.nu then
		sep = "%#string#" .. sep
	end

	return string.rep(' ', 6 - #sep) .. sep .. ' '
end

require("statuscol").setup(
	{
		relculright = true,
		segments = {
			{ text = { foldfunc }, },
			{
				text = { lnumfunc },
			},
			{
				text = { "%s" },
				maxwidth = 1,
			},
		},
	}
)
