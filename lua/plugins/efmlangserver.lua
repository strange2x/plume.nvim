return {
	"creativenull/efmls-configs-nvim",
	dependencies = { "neovim/nvim-lspconfig" },
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
				local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

				-- If efm is not there, try using the LSP formatting,
				if vim.tbl_isempty(efm) then
					vim.lsp.buf.format({ bufnr = ev.buf })
				else
					vim.lsp.buf.format({ name = "efm", bufnr = ev.buf })
				end
			end,
		})
	end,
}
