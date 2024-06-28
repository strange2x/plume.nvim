return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = require("default_installed").treesitter,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
			indent = {
				enabled = true,
			},
		})
	end
}
