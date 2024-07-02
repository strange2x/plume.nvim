return {
	"creativenull/efmls-configs-nvim",
	dependencies = { "neovim/nvim-lspconfig", "mhartington/formatter.nvim" },
	event = { "LspAttach" },
	config = function()
		local languages = require("efmls-configs.defaults").languages()
		languages = vim.tbl_extend("force", languages, {
			-- Custom languages, or override existing ones
			html = {
				require("efmls-configs.formatters.prettier"),
			},
			lua = {
				require("efmls-configs.formatters.stylua"),
			},
			go = {
				require("efmls-configs.linters.golangci_lint"),
				require("efmls-configs.formatters.gofumpt"),
			},
			python = {
				require("efmls-configs.formatters.black"),
			},
			sh = {
				require("efmls-configs.formatters.shfmt"),
			},
		})

		local formatter = require("formatter")
		formatter.setup({
			filetype = {
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		local efmls_config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				rootMarkers = { ".git/", "node_modules/" },
				languages = languages,
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
			},
		}

		require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))

		local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = lsp_fmt_group,
			callback = function(ev)
				local fidget = require("fidget")
				if languages[vim.bo.filetype] == nil then
					local formatter_filetypes = require("formatter.config").values.filetype
					if formatter_filetypes[vim.bo.filetype] then
						fidget.notification.notify("Formatting using Formatter.nvim")
						local augroup = vim.api.nvim_create_augroup
						local autocmd = vim.api.nvim_create_autocmd
						augroup("__formatter__", { clear = true })
						autocmd("BufWritePost", {
							group = "__formatter__",
							command = ":FormatWrite",
						})
					else
						fidget.notification.notify("Trying Formatting using LSP")
						vim.lsp.buf.format({ bufnr = ev.buf, async = false })
					end
				else
					local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })
					if vim.tbl_isempty(efm) then
						return
					else
						fidget.notification.notify("Formatting using EFM Langserver")
						vim.lsp.buf.format({ name = "efm", bufnr = ev.buf, async = false })
					end
				end
			end,
		})
	end,
}
