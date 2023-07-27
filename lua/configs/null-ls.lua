local M = {}

M.config = function(null_ls)
	null_ls.setup({
		sources = require("null-ls-sources").get_sources(null_ls),
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end,
	})
end

M.setup = function()
	local status, null_ls = pcall(require, "null-ls")
	if not status then
		print("Null-ls not installed")
		return
	end
	M.config(null_ls)
end

return M
