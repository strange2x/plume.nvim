---@diagnostic disable: 113
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")
		require("telescope").setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
		require("telescope").load_extension("ui-select")

		vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "[Telescope] Find Git Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[Telescope] Find in Files" })
		vim.keymap.set("n", "<leader>lb", builtin.buffers, { desc = "[Telescope] Buffer list" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[Telescope] Show Help" })

		-- LSP Remaps
		vim.keymap.set("n", "gr", "<CMD>Telescope lsp_references<CR>", { desc = "[LSP] Show References" })
		vim.keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", { desc = "[LSP] Show Definitions" })
		vim.keymap.set(
			"n",
			"<leader>D",
			"<CMD>Telescope lsp_type_definitions<CR>",
			{ desc = "[LSP] Show Type Definitions" }
		)
		vim.keymap.set(
			"n",
			"<leader>ds",
			"<CMD>Telescope lsp_document_symbols<CR>",
			{ desc = "[LSP] Show Document Symbols" }
		)
	end,
}
