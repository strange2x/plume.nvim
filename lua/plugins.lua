local plugins = {
	{ "nvim-treesitter/nvim-treesitter", config = require("configs.treesitter").setup },
	{
		"dasupradyumna/midnight.nvim",
		lazy = false,
		priority = 1000,
		config = require("configs.colorscheme").setup,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("configs.telescope").setup,
	},
	{ "nvim-telescope/telescope-fzy-native.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
	{ "mbbill/undotree", config = require("configs.undotree").set_keymaps },
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("configs.harpoon").setup,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = require("configs.mason").setup,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"neovim/nvim-lspconfig",
		},
	},
}

return plugins
