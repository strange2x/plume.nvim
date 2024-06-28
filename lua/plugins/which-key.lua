return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  },
  config = function()
	  local which_key = require("which-key")
	  which_key.register({
		  ["<leader>"] = {
			  l = { name = "LSP"},
			  f = { name = "File"},
		  }
	  })
  end
}
