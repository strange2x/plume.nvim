local function setup_mason()
		require("mason").setup()
end

local function setup_lsp_servers()
		local mason_lsp = require("mason-lspconfig")
		mason_lsp.setup({
			ensure_installed = require("default_installed").mason_lspconfig,
			automatic_installation = true,
		})

		mason_lsp.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end
		})
end

local function create_lspattach_mappings()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(e)
			vim.bo[e.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			local default_mappings = require("config.lsp_mappings").lsp_default_keymaps
			default_mappings(e)

			-- Setup lspsaga keymaps
			vim.keymap.set("n", "<leader>lca", "<cmd>Lspsaga code_action<cr>", {silent = true, desc = "[L]sp [C]ode [A]ctions"})
			vim.keymap.set("n", "<leader>lbd", "<cmd>Lspsaga show_buf_diagnostics<cr>", {silent = true, desc = "[L]sp [B]uffer [D]iagnostics", buffer = e.buf})
			vim.keymap.set("n", "<leader>lwd", "<cmd>Lspsaga show_workspace_diagnostics<cr>", {silent = true, desc = "[L]sp [W]orkspace [D]iagnostics"})
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", {silent = true, desc = "LSP Hover Documentation"})
			vim.keymap.set("n", "<leader>lpd", "<cmd>Lspsaga peek_definition<cr>", {silent = true, desc = "[L]sp [P]eek [D]efinition"})
			vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>", {silent = true, desc = "[L]sp Goto Definition"})

			-- Diagnostics
			vim.keymap.set("n", "<leader>[d", "<cmd>Lspsaga diagnostics_jump_prev<cr>", {silent = true, desc = "Lsp Diagnostic Previous"})
			vim.keymap.set("n", "<leader>]d", "<cmd>Lspsaga diagnostics_jump_next<cr>", {silent = true, desc = "Lsp Diagnostic Next"})

			vim.keymap.set("n", "gR", "<cmd>Lspsaga rename<cr>", {silent = true, desc = "[L]sp Rename"})

		end
	})
end


return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{'nvimdev/lspsaga.nvim',dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}},
	},
	config = function()
		setup_mason()
		setup_lsp_servers()
		create_lspattach_mappings()
		require("lspsaga").setup()
	end
}
