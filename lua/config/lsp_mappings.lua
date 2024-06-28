local M = {}

M.lsp_default_keymaps = function(e)
	local lsp = vim.lsp.buf
	local _, lspsaga_present = pcall(require, "lspsaga")
		vim.keymap.set("n", "gD", lsp.declaration, {silent = true, desc = "[L]sp Goto Declaration", buffer = e.buf})
		vim.keymap.set("n", "gi", lsp.implementation, {silent = true, desc = "[L]sp Goto Implementatoin", buffer = e.buf})
		vim.keymap.set("n", "<leader>lsh", lsp.signature_help, {silent = true, desc = "[L]sp [S]ignature [H]elp", buffer = e.buf})

		if not lspsaga_present then
		vim.keymap.set("n", "<leader>lca", lsp.code_action, {silent = false, desc = "[L]sp [C]ode [A]ction", buffer = e.buf})
		end
end


return M
