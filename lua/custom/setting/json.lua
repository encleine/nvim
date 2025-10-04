local plenary = require("plenary.path")

local data = {
	settings = nil,
	palette = nil,
}

local function read_json_file(filepath)
	local loc = "settings"
	if string.find(filepath, "palette.json") then
		loc = "palette"
	end

	if data[loc] then
		return data[loc]
	end

	local path = plenary:new(filepath)
	if not path:exists() then
		return {}
	end

	local content = path:read()
	data[loc] = vim.json.decode(content)
	return data[loc]
end

local function write_json_file(filepath, data)
	local file = io.open(filepath, "w")
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
local palette_path = vim.fn.stdpath("config") .. "/palette.json"

return {
	settings = function()
		return read_json_file(settings_path)
	end,
	palette = function()
		return read_json_file(palette_path)
	end,
	save_settings = function(new_settings)
		data.settings = new_settings
		write_json_file(settings_path, new_settings)
	end,

	save_palette = function(new_palette)
		data.palette = new_palette
		write_json_file(palette_path, new_palette)
	end,

	settings_path = settings_path,
	palette_path = palette_path,
}
