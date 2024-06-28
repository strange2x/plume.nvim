return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {},
			extensions = {},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { silent = true, desc = "[F]ind [G]it Files" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { silent = true, desc = "Help Tags" })
		vim.keymap.set("n", "<leader>bb", builtin.buffers, { silent = true, desc = "Buffers" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserTelescopeLspConfig", {}),
			callback = function(e)
				vim.keymap.set(
					"n",
					"<leader>lds",
					builtin.lsp_document_symbols,
					{ silent = true, desc = "[L]sp [D]ocument [S]ymbols", buffer = e.buf }
				)
				vim.keymap.set(
					"n",
					"<leader>lws",
					builtin.lsp_workspace_symbols,
					{ silent = true, desc = "[L]sp [W]orkspace [S]ymbols", buffer = e.buf }
				)
				vim.keymap.set(
					"n",
					"gr",
					builtin.lsp_references,
					{ silent = true, desc = "[L]sp Show References", buffer = e.buf }
				)
			end,
		})
	end,
}
