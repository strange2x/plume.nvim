return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon_ui = require("harpoon.ui")
		local harpoon_mark = require("harpoon.mark")

		vim.keymap.set(
			"n",
			"<leader>ht",
			harpoon_ui.toggle_quick_menu,
			{ desc = "[Harpoon] Toggle Harpoon UI", silent = true, noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ha",
			harpoon_mark.add_file,
			{ desc = "[Harpoon] Add current file to Harpoon", silent = true, noremap = true }
		)

		vim.keymap.set(
			"n",
			"<leader>hn",
			harpoon_ui.nav_next,
			{ desc = "[Harpoon] Navigate Next", silent = true, noremap = true }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			harpoon_ui.nav_prev,
			{ desc = "[Harpoon] Navigate Previous", silent = true, noremap = true }
		)

		vim.keymap.set("n", "<C-1>", function()
			harpoon_ui.nav_file(1)
		end, { desc = "[Harpoon] Navigate to File 1", silent = true, noremap = true })
		vim.keymap.set("n", "<C-2>", function()
			harpoon_ui.nav_file(2)
		end, { desc = "[Harpoon] Navigate to File 2", silent = true, noremap = true })
		vim.keymap.set("n", "<C-3>", function()
			harpoon_ui.nav_file(3)
		end, { desc = "[Harpoon] Navigate to File 3", silent = true, noremap = true })
		vim.keymap.set("n", "<C-4>", function()
			harpoon_ui.nav_file(4)
		end, { desc = "[Harpoon] Navigate to File 4", silent = true, noremap = true })
		vim.keymap.set("n", "<C-5>", function()
			harpoon_ui.nav_file(5)
		end, { desc = "[Harpoon] Navigate to File 5", silent = true, noremap = true })
		vim.keymap.set("n", "<C-6>", function()
			harpoon_ui.nav_file(6)
		end, { desc = "[Harpoon] Navigate to File 6", silent = true, noremap = true })
		vim.keymap.set("n", "<C-7>", function()
			harpoon_ui.nav_file(7)
		end, { desc = "[Harpoon] Navigate to File 7", silent = true, noremap = true })
		vim.keymap.set("n", "<C-8>", function()
			harpoon_ui.nav_file(8)
		end, { desc = "[Harpoon] Navigate to File 8", silent = true, noremap = true })
		vim.keymap.set("n", "<C-9>", function()
			harpoon_ui.nav_file(9)
		end, { desc = "[Harpoon] Navigate to File 9", silent = true, noremap = true })
		vim.keymap.set("n", "<C-0>", function()
			harpoon_ui.nav_file(0)
		end, { desc = "[Harpoon] Navigate to File 10", silent = true, noremap = true })
	end,
}
