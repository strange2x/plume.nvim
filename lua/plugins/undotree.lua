return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>U", "<cmd>UndotreeToggle<cr>", { silent = true, desc = "UndoTree Toggle" })
	end,
}
