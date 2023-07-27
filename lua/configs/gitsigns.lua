local M = {}

M.config = function(gitsigns)
	gitsigns.setup()
end

M.setup = function()
	local status, gitsigns = pcall(require, "gitsigns")
	if not status then
		print("Gitsigns not installed")
		return
	end
	M.config(gitsigns)
end

return M
