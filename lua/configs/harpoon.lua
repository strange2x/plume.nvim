local M = {}

M.integrate_telescope = function()
	local status, telescope = pcall(require, "telescope")
	if not status then
		vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { silent = true })
	end
	telescope.load_extension("harpoon")
	vim.keymap.set("n", "<leader>hh", "<CMD>Telescope harpoon marks<CR>", { silent = true })
end

M.set_keymaps = function()
	vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { silent = true })
end

M.setup = function()
	local status, _ = pcall(require, "harpoon")
	if not status then
		print("Harpoon not found, Primagen will kill you")
		return
	end
	M.set_keymaps()
	M.integrate_telescope()
end

return M
