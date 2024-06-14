return {
	"mhartington/formatter.nvim",
	config = function()
		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").autoflake,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},

				typescriptreact = {
					require("formatter.filetypes.typescript").prettierd,
				},

				javascript = {
					require("formatter.filetypes.typescript").prettierd,
				},
				javascriptreact = {
					require("formatter.filetypes.typescript").prettierd,
				},
				go = {
					require("formatter.filetypes.go").gofmt,
				},
				terraform = {
					require("formatter.filetypes.terraform").terraformfmt,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
