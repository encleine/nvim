return function()
	local function fold_info(args)
		local lnum = args.lnum
		local last_line = vim.api.nvim_buf_line_count(0)

		local level = vim.fn.foldlevel(lnum)
		local closed_line = vim.fn.foldclosed(lnum)
		local in_closed = closed_line ~= -1

		local start = false
		if in_closed then
			start = closed_line == lnum
		else
			start = level > vim.fn.foldlevel(lnum - 1)
		end

		local last = false
		if lnum < last_line then
			local next_level = vim.fn.foldlevel(lnum + 1)
			local next_closed_line = vim.fn.foldclosed(lnum + 1)
			local next_starts = false
			if next_closed_line ~= -1 then
				next_starts = next_closed_line == lnum + 1
			else
				next_starts = next_level > level
			end
			last = (next_starts and next_level <= level) or next_level == 0
		else
			last = true
		end

		return {
			level = level,
			closed = in_closed and (vim.fn.foldclosedend(lnum) ~= lnum),
			start = start,
			last = last,
		}
	end

	local function foldfunc(args)
		local width = args.fold.width
		if width == 0 then
			return ""
		end

		local fold = fold_info(args)
		local sep = ""
		local level = fold.level
		local closed = fold.closed
		local range = level < width and level or width
		local start = fold.start

		if level == 0 then
			return (" "):rep(width) .. "%*"
		end

		if closed and level == 1 then
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
		if not args.rnu and not args.nu then
			return ""
		end
		if args.virtnum ~= 0 then
			return "%="
		end

		local lnum = args.rnu and (args.relnum > 0 and args.relnum or (args.nu and args.lnum or 0)) or args.lnum
		local sep = "%=" .. lnum

		if args.rnu and args.relnum <= 0 and args.nu then
			sep = "%#string#" .. sep
		end

		return string.rep(" ", 6 - #sep) .. sep .. " "
	end

	require("statuscol").setup({
		relculright = true,
		segments = {
			{
				hl = "FoldColumn",
				text = { foldfunc },
			},
			{
				text = { lnumfunc },
			},
			{
				text = { "%s" },
				maxwidth = 1,
			},
		},
	})
end
