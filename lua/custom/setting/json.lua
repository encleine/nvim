local plenary = require("plenary.path")

local settings_path = vim.fn.stdpath("config") .. "/settings.json"
local palette_path = vim.fn.stdpath("config") .. "/palette.json"

local cache_duration = 10
local cache = {}

local function read_json_file(filepath, cache_key)
	local key = cache_key or filepath
	local now = vim.uv.now()

	local cached = cache[key]
	if cached and now - cached.loaded_at < cache_duration * 1000 then
		return cached.data
	end

	local path = plenary:new(filepath)
	if not path:exists() then
		cache[key] = { data = {}, loaded_at = now }
		return {}
	end

	local ok, data = pcall(vim.json.decode, path:read())
	if not ok then
		vim.notify("Failed to parse " .. filepath, vim.log.levels.ERROR)
		return {}
	end

	cache[key] = { data = data, loaded_at = now }

	if key == "settings" and type(data.cache_duration) == "number" then
		cache_duration = data.cache_duration
	end

	return data
end

local function write_json_file(filepath, data, cache_key)
	local ok, encoded = pcall(vim.json.encode, data)
	if not ok then
		vim.notify("Failed to encode data for " .. filepath, vim.log.levels.ERROR)
		return
	end

	local file = io.open(filepath, "w")
	if not file then
		vim.notify("Could not open " .. filepath .. " for writing", vim.log.levels.ERROR)
		return
	end

	file:write(encoded)
	file:flush()
	file:close()

	local key = cache_key or filepath
	cache[key] = { data = data, loaded_at = vim.loop.now() }
end

return {
	settings = function()
		return read_json_file(settings_path, "settings")
	end,
	palette = function()
		return read_json_file(palette_path, "palette")
	end,
	save_settings = function(new_settings)
		write_json_file(settings_path, new_settings, "settings")
	end,
	save_palette = function(new_palette)
		write_json_file(palette_path, new_palette, "palette")
	end,
	settings_path = settings_path,
	palette_path = palette_path,
}
