return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 40,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { silent = true, desc = "Toggle Explorer" })
	end,
}
