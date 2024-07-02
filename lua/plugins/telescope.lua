return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
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
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { silent = true, desc = "[F]ind [G]it Files" })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { silent = true, desc = "Help Tags" })
		vim.keymap.set("n", "<leader>bb", builtin.buffers, { silent = true, desc = "Buffers" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Search Term > ") })
		end, { silent = true, desc = "Buffers" })

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
