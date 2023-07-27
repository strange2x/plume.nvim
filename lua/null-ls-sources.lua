local M = {}

M.get_sources = function(null_ls)
	return {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.terraform_validate,
		null_ls.builtins.formatting.terraform_fmt,
	}
end

return M
