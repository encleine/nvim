local plenary = require('plenary.path')

local settings_data = nil

local function read_json_file(filepath)
	if settings_data then
		return settings_data
	end

	local path = plenary:new(filepath)
	if path:exists() then
		local content = path:read()
		settings_data = vim.json.decode(content)
		return settings_data
	end
	return {}
end


local function write_json_file(filepath, data)
	local file = io.open(filepath, 'w')
	if not file then
		vim.notify("Error: Could not open file: " .. filepath, vim.log.levels.ERROR)
		return nil
	end
	data = vim.json.encode(data)
	file:write(data)
	file:flush()
	file:close()
end


local settings_path = vim.fn.stdpath("config") .. "/settings.json"
return {
	settings = read_json_file(settings_path),
	write_json_file = write_json_file,
	settings_path = settings_path,
}
