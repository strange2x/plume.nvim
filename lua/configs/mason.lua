local M = {}

local lsp_keymaps = require("configs.lspconfig").default_keymaps

M.config_mason = function(mason)
	mason.setup()
end

M.config_mason_lspconfig = function(mason_lspconfig, lspconfig)
	mason_lspconfig.setup({
		ensure_installed = {},
	})
	mason_lspconfig.setup_handlers({
		function(server)
			lspconfig[server].setup({
				on_attach = function()
					require("configs.null-ls").setup()
				end,
				capabilities = require("configs.cmp").get_capabilities(),
			})
		end,
	})
end

M.setup = function()
	local status_mason, mason = pcall(require, "mason")
	if not status_mason then
		print("Mason not installed")
		return
	end
	local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not status_mason_lspconfig then
		print("Mason LSP Config not installed")
		return
	end
	local status_lspconfig, lspconfig = pcall(require, "lspconfig")
	if not status_lspconfig then
		print("LSPConfig not installed")
		return
	end
	lsp_keymaps()
	M.config_mason(mason)
	M.config_mason_lspconfig(mason_lspconfig, lspconfig)
end

return M
