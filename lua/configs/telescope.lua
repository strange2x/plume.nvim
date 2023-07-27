local M = {}

M.set_keymaps = function()
	local builtin = require("telescope.builtin")

	local opts = { silent = true }

	vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
	vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
end

M.config = function(telescope)
	telescope.setup({
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
		},
	})

	M.set_keymaps()
	telescope.load_extension("fzy_native")
end

M.is_present = function()
	local status, telescope = pcall(require, "telescope")
	if not status then
		print("Telescope not found")
		return
	end
	return telescope
end

M.setup = function()
	local telescope = M.is_present()
	M.config(telescope)
end

return M
