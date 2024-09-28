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


local function foldfunc(args)
	local width = args.fold.width
	if width == 0 then return "" end


	local fold = fold_info(args)
	local sep = "%#ErrorMsg#"
	local level = fold.level
	local closed = fold.closed
	local range = level < width and level or width
	local start = fold.start


	-- local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
	-- if math.abs(args.lnum - r) > 50 then
	-- 	return sep .. "🮲🮳"
	-- end


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

require("statuscol").setup(
	{
		relculright = true,
		segments = {
			{ text = { foldfunc }, },
			{
				text = {
					function(args)
						local st = builtin.lnumfunc(args, args.lnum)
						st = string.sub(st, 1, #st)
						return string.rep(' ', 5 - #st) .. st .. ' '
					end,
				},
			},
			{
				text = { "%s" },
				maxwidth = 1,
			},
		},
	}
)
