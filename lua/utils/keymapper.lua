local M = {}

M.command_keymap = function(mode, keymap, command, description)
	vim.keymap.set(mode, keymap, command, {silent = true, desc = description})
end

return M
