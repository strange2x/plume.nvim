return {
	"folke/zen-mode.nvim",
	dependencies = {
		"folke/twilight.nvim",
	},
	opts = {
		window = {
			backdrop = 0.90,
		},
		plugins = {
			tmux = {
				enabled = true,
			},
			kitty = {
				enabled = true,
				font = "+4",
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>tw", "<CMD>Twilight<CR>", { desc = "[TW]ilight Toggle" })
		vim.keymap.set("n", "<leader>zm", "<CMD>ZenMode<CR>", { desc = "[Z]en[M]ode Toggle" })
	end,
}
