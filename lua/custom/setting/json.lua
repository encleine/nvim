local function read_file_contents(filepath)
	local file = io.open(filepath, "r")
	if not file then
		vim.notify("Error: Could not open file: " .. filepath, vim.log.levels.ERROR)
		return nil
	end

	local content = file:read("*a")
	file:close()
	return content
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
local json_string = read_file_contents(settings_path)

if not json_string then
	json_string = "{}"
end



return {
	settings = vim.json.decode(json_string),
	write_json_file = write_json_file,
	read_file_contents = read_file_contents,
	settings_path = settings_path,
}
