local M = {}

function M.get_git_root()
	local result = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
	if vim.v.shell_error ~= 0 then
		return nil
	end
	return vim.trim(result)
end

function M.Get_git_repo_status()
	local git_root = M.get_git_root()

	if not git_root then
		return
	end

	local result = vim.fn.system("git -C " .. vim.fn.shellescape(git_root) .. " status --porcelain")

	if vim.v.shell_error ~= 0 then
		return
	end

	local status_dict = {
		added = 0,
		changed = 0,
		removed = 0,
		untracked = 0,
	}

	for line in result:gmatch("[^\r\n]+") do
		local staged = line:sub(1, 1)
		local working = line:sub(2, 2)

		if staged == "?" then
			status_dict.untracked = status_dict.untracked + 1
		else
			if staged == "A" then
				status_dict.added = status_dict.added + 1
			end

			if staged == "M" or working == "M" then
				status_dict.changed = status_dict.changed + 1
			end

			if staged == "D" or working == "D" or staged == "R" then
				status_dict.removed = status_dict.removed + 1
			end
		end
	end

	return status_dict
end

return M
