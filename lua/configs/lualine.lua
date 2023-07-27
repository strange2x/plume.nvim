local M = {}

M.config = function(lualine)
	lualine.setup()
end

M.setup = function()
	local status, lualine = pcall(require, "lualine")
	if not status then
		print("Lualine not installed")
		return
	end
	M.config(lualine)
end

return M
