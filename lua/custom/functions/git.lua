local M = {}

function M.get_git_root()
	local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	if result and result ~= "" then
		return result:gsub("\n", "")
	end

	return nil
end

function M.Get_git_repo_status()
	local git_root = M.get_git_root()

	if not git_root then
		return
	end

	-- Run `git status --porcelain` to get the repository status
	local handle = io.popen("git status --porcelain 2>/dev/null")
	if not handle then
		return
	end

	local result = handle:read("*a")
	handle:close()

	local status_dict = {
		added = 0,
		changed = 0,
		removed = 0,
		untracked = 0,
	}

	for line in result:gmatch("[^\r\n]+") do
		local change = line:sub(1, 2)

		if change:find("^A") then
			status_dict.added = status_dict.added + 1
		elseif change:find("^ M") then
			status_dict.changed = status_dict.changed + 1
		elseif change:find("^D") then
			status_dict.removed = status_dict.removed + 1
		elseif change:find("??") then
			status_dict.untracked = status_dict.untracked + 1
		end
	end

	return status_dict
end

return M
