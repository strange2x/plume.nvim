local M = {}

M.config = function(null_ls)
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.eslint,
			null_ls.builtins.completion.spell,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.diagnostics.terraform_validate,
			null_ls.builtins.formatting.terraform_fmt,
		},
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
