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
		vim.keymap.set("n", "<leader>tw", "<CMD>Twilight<CR>")
		vim.keymap.set("n", "<leader>zm", "<CMD>ZenMode<CR>")
	end,
}
